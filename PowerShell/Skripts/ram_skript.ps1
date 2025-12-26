# --- WIEDERHERSTELLUNGS-SKRIPT ---
# Setzt alle zuvor deaktivierten Dell- und Waves-Dienste auf "Automatisch" und startet sie.

Write-Host "Beginne mit der Wiederherstellung der Systemdienste..." -ForegroundColor Red

# Liste der Dienste, die wiederhergestellt werden sollen
$servicesToRestore = @(
    "WavesSysSvc",
    "WavesAudioSvc",
    "DellTechHub",
    "DellOptimizer",
    "DellTrustedDevice",
    "DellClientManagementService",
    "DellCoreServices",
    "DellDigitalDelivery",
    "DellDigitalDeliveryService",
    "DellUpdate",
    "SupportAssistAgent",
    "DDVDataCollector",
    "DDVRulesProcessor"
)

foreach ($serviceName in $servicesToRestore) {
    # Prüfen, ob der Dienst existiert
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($service) {
        Write-Host "--- Stelle Dienst wieder her: $serviceName ---"
        if ($service.StartType -ne 'Automatic') {
            Write-Host "   -> Setze Starttyp auf 'Automatisch'..."
            Set-Service -Name $serviceName -StartupType Automatic -ErrorAction SilentlyContinue
        }
        if ($service.Status -ne 'Running') {
            Write-Host "   -> Starte Dienst..."
            Start-Service -Name $serviceName -ErrorAction SilentlyContinue
        }
    }
}

Write-Host "`n--- WIEDERHERSTELLUNG ABGESCHLOSSEN ---`n" -ForegroundColor Green
Write-Host "Alle Dienste wurden wieder auf 'Automatisch' gesetzt und gestartet."
Write-Host "Bitte reaktivieren Sie nun die Autostart-Programme und starten Sie den PC neu."