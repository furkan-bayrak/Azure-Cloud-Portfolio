<#
.SYNOPSIS
  Organisiert Dateien in einem Zielordner, indem für jede Dateiendung ein eigener Unterordner erstellt wird.

.DESCRIPTION
  Dieses Skript analysiert alle Dateien in einem angegebenen Ordner. Für jeden gefundenen Dateityp
  (z.B. .pdf, .jpg, .zip) wird ein entsprechender Ordner (z.B. "pdf", "jpg", "zip") erstellt,
  sofern dieser noch nicht existiert. Anschließend werden alle Dateien in die passenden Ordner verschoben.

  - DYNAMISCH: Erstellt Ordner basierend auf den tatsächlich vorhandenen Dateitypen.
  - ROBUST: Behandelt Dateinamenskonflikte automatisch durch Umbenennen.
  - BENUTZERFREUNDLICH: Gibt am Ende einen klaren Bericht über die durchgeführten Aktionen aus.

.NOTES
  Dateiname: Sortieren-nach-Typ.ps1
  Version: 2.0
#>

# 1. KONFIGURATION
# --------------------------------------------------------------------------
# --- BITTE DIESE ZEILE ANPASSEN, um den zu organisierenden Ordner festzulegen. ---
# Ersetzen Sie 'IhrBenutzername' durch Ihren tatsächlichen Windows-Benutzernamen.
$Zielordner = "C:\Users\furka\Downloads"


# Initialisiert einen Zähler für den Abschlussbericht.
$verschobenBericht = @{}
$insgesamtVerschoben = 0


# 2. SICHERHEITSPRÜFUNG
# --------------------------------------------------------------------------
# Überprüft, ob der angegebene Zielordner existiert.
if (-not (Test-Path -Path $Zielordner -PathType Container)) {
    Write-Error "Aktion gestoppt: Der Ordner '$Zielordner' wurde nicht gefunden. Bitte überprüfen Sie den Pfad und versuchen Sie es erneut."
    exit 1 # Beendet das Skript mit einem Fehlercode.
}


# 3. DATEIEN VERARBEITEN
# --------------------------------------------------------------------------
Write-Host "Durchsuche Dateien im Ordner '$Zielordner'..."
Get-ChildItem -Path $Zielordner -File | ForEach-Object {
    $datei = $_
    
    # Überspringe Dateien ohne Dateiendung
    if (-not $datei.Extension) {
        return # Gehe zur nächsten Datei
    }
    
    # Ordnername aus der Dateiendung ableiten (z.B. ".pdf" -> "pdf")
    $ordnerName = $datei.Extension.TrimStart('.').ToLower()
    $zielUnterordner = Join-Path -Path $Zielordner -ChildPath $ordnerName

    # Erstelle den Unterordner, falls er noch nicht existiert
    if (-not (Test-Path -Path $zielUnterordner)) {
        Write-Host "Erstelle Ordner: ...\$ordnerName"
        New-Item -Path $zielUnterordner -ItemType Directory -Force | Out-Null
    }
    
    # Robuste Behandlung von Dateinamenskonflikten
    $zieldatei = Join-Path -Path $zielUnterordner -ChildPath $datei.Name
    $zaehler = 1
    while (Test-Path -LiteralPath $zieldatei) {
        # Wenn eine Datei mit demselben Namen existiert, erstelle einen neuen Namen wie "MeineDatei(1).txt"
        $neuerName = "{0}({1}){2}" -f $datei.BaseName, $zaehler, $datei.Extension
        $zieldatei = Join-Path -Path $zielUnterordner -ChildPath $neuerName
        $zaehler++
    }

    # Verschiebe die Datei an ihren neuen, sicheren Ort
    Move-Item -LiteralPath $datei.FullName -Destination $zieldatei
    
    # Aktualisiere die Zähler für den Bericht
    if ($verschobenBericht.ContainsKey($ordnerName)) {
        $verschobenBericht[$ordnerName]++
    } else {
        $verschobenBericht[$ordnerName] = 1
    }
    $insgesamtVerschoben++
}


# 4. ABSCHLUSSBERICHT AUSGEBEN
# --------------------------------------------------------------------------
Write-Host "`nZusammenfassung der Organisation:" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan

if ($insgesamtVerschoben -eq 0) {
    Write-Host "Es wurden keine zu verschiebenden Dateien gefunden." -ForegroundColor Yellow
} else {
    # Sortiere den Bericht alphabetisch nach Ordnernamen
    $verschobenBericht.GetEnumerator() | Sort-Object Name | ForEach-Object {
        $ordner = $_.Name
        $anzahl = $_.Value
        $dateienWort = if ($anzahl -eq 1) { "Datei" } else { "Dateien" }
        
        # Formatierung für eine saubere Ausrichtung
        $nachricht = "{0,-10} : {1} {2} verschoben nach ...\{0}" -f $ordner, $anzahl, $dateienWort
        Write-Host $nachricht -ForegroundColor Green
    }
    Write-Host "`nInsgesamt organisierte Dateien: $insgesamtVerschoben" -ForegroundColor Cyan
}

Write-Host "`nDer Vorgang wurde erfolgreich abgeschlossen!" -ForegroundColor Cyan