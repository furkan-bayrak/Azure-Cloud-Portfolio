import os
import shutil
import time
from pathlib import Path

def safe_move(src, dst):
    """Verschiebt eine Datei, fügt ggf. ein Suffix hinzu, falls dst existiert."""
    if not dst.parent.exists():
        dst.parent.mkdir(parents=True, exist_ok=True)

    counter = 1
    original_dst = dst
    while dst.exists():
        stem = original_dst.stem
        suffix = original_dst.suffix
        dst = original_dst.with_name(f"{stem}_{counter}{suffix}")
        counter += 1
    shutil.move(str(src), str(dst))
    return dst

def organize_files_by_extension_and_mtime(source_dir, target_dir):
    source = Path(source_dir).resolve()
    target = Path(target_dir).resolve()

    if not source.is_dir():
        raise ValueError(f"Quellordner existiert nicht: {source}")

    target.mkdir(parents=True, exist_ok=True)

    print(f"Durchsuche: {source}")
    print(f"Zielordner: {target}\n")

    moved_count = 0

    # Alle Dateien rekursiv finden
    for file_path in source.rglob('*'):
        if not file_path.is_file():
            continue

        try:
            stat = file_path.stat()
            mtime = stat.st_mtime
            ext = file_path.suffix.lower().lstrip('.')  # z. B. 'pdf', nicht '.pdf'
            if not ext:
                ext = 'no_extension'

            # Lesbares Datum für den Dateinamen: YYYY-MM-DD_HH-MM
            mtime_str = time.strftime('%Y-%m-%d_%H-%M', time.localtime(mtime))

            # Neuer Dateiname: {Datum}_{Originalname}{.ext}
            new_name = f"{mtime_str}_{file_path.name}"
            dest_folder = target / ext
            dest_path = dest_folder / new_name

            # Verschieben (mit Kollisionsvermeidung)
            final_path = safe_move(file_path, dest_path)

            print(f"Verschoben: {file_path} → {final_path}")
            moved_count += 1

        except (OSError, IOError, PermissionError) as e:
            print(f"Fehler bei {file_path}: {e}")

    print(f"\n✅ Fertig! {moved_count} Dateien wurden verschoben und umbenannt.")

def main():
    source = input("Quellordner (alle Dateien hier und in Unterordnern werden verarbeitet): ").strip()
    target = input("Zielordner (hier werden Unterordner wie 'pdf', 'jpg' erstellt): ").strip()

    if not source or not target:
        print("Beide Pfade müssen angegeben werden.")
        return

    try:
        organize_files_by_extension_and_mtime(source, target)
    except Exception as e:
        print(f"Kritischer Fehler: {e}")

if __name__ == "__main__":
    main()