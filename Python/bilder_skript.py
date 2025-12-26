import os
from PIL import Image
import imagehash
from collections import defaultdict

# Pfade anpassen!
ORDNER_PFAD = r"D:\Alt\Festplatten sachen\Windows\JPG"  # <-- Hier deinen Ordner eintragen
SICHERHEITSKOPIE = False  # Setze auf False, wenn du wirklich löschen willst

# Optional: unterstützte Bildformate
UNTERSTÜTZTE_FORMATE = {'.jpg', '.jpeg', '.png', '.bmp', '.gif', '.tiff', '.webp'}

def ist_bild(datei):
    return os.path.splitext(datei)[1].lower() in UNTERSTÜTZTE_FORMATE

def get_image_resolution(img_path):
    try:
        with Image.open(img_path) as img:
            return img.width * img.height
    except Exception as e:
        print(f"Fehler beim Öffnen von {img_path}: {e}")
        return -1

def main():
    bilder_pfade = []
    hash_gruppen = defaultdict(list)

    # 1. Alle Bilder sammeln
    for root, _, files in os.walk(ORDNER_PFAD):
        for file in files:
            if ist_bild(file):
                bilder_pfade.append(os.path.join(root, file))

    if not bilder_pfade:
        print("Keine Bilder gefunden!")
        return

    print(f"Gefundene Bilder: {len(bilder_pfade)}")

    # 2. Hash für jedes Bild berechnen
    print("Berechne Bild-Hashes...")
    for pfad in bilder_pfade:
        try:
            with Image.open(pfad) as img:
                # Konvertiere zu RGB falls nötig (z. B. bei PNG mit Transparenz)
                if img.mode != 'RGB':
                    img = img.convert('RGB')
                phash = imagehash.phash(img)
                hash_gruppen[str(phash)].append(pfad)
        except Exception as e:
            print(f"Kann Bild nicht verarbeiten: {pfad} – Fehler: {e}")

    # 3. Für jede Gruppe das Bild mit höchster Auflösung behalten
    zu_loeschen = []
    for hash_wert, pfade in hash_gruppen.items():
        if len(pfade) <= 1:
            continue  # Kein Duplikat

        # Sortiere nach Auflösung (absteigend)
        pfade.sort(key=get_image_resolution, reverse=True)
        zu_behalten = pfade[0]
        zu_loeschen.extend(pfade[1:])

        print(f"\nGruppe mit Hash {hash_wert}:")
        print(f"  Behalten: {zu_behalten} (Auflösung: {get_image_resolution(zu_behalten)})")
        for p in pfade[1:]:
            print(f"  Löschen: {p} (Auflösung: {get_image_resolution(p)})")

    # 4. Löschen (oder nur anzeigen)
    if zu_loeschen:
        print(f"\nInsgesamt {len(zu_loeschen)} Duplikate zum Löschen gefunden.")
        if SICHERHEITSKOPIE:
            print("\n⚠️  SICHERHEITSKOPIE MODUS: Dateien werden NICHT gelöscht!")
            print("Setze 'SICHERHEITSKOPIE = False', um wirklich zu löschen.")
        else:
            bestaetigung = input("\nMöchtest du diese Dateien wirklich LÖSCHEN? (ja/nein): ")
            if bestaetigung.lower() == 'ja':
                for datei in zu_loeschen:
                    try:
                        os.remove(datei)
                        print(f"Gelöscht: {datei}")
                    except Exception as e:
                        print(f"Fehler beim Löschen von {datei}: {e}")
                print("✅ Fertig! Duplikate wurden entfernt.")
            else:
                print("Abgebrochen. Keine Dateien gelöscht.")
    else:
        print("Keine Duplikate gefunden. Alles sauber!")

if __name__ == "__main__":
    main()