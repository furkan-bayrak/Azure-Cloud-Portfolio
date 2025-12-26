# Optimal Script for a Faster Windows 11 Laptop

# --- Section 1: System Configuration Tweaks ---

# 1.1. Enable Ultimate Performance Power Plan
# This power plan provides maximum performance by eliminating power-saving features.
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

# 1.2. Disable Visual Effects for Better Performance
# This reduces the load on the GPU and can make the UI feel snappier.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2

# 1.3. Disable Unnecessary Services
# Disabling services that are not essential for your workflow can free up resources.
# Example: Disabling the Print Spooler if you don't use a printer.
# Get-Service -Name "Spooler" | Set-Service -StartupType Disabled -Status Stopped

# --- Section 2: Debloating Windows ---

# 2.1. Remove specific pre-installed applications
# Add or remove applications from this list based on your needs.
$bloatware = @(
    "Microsoft.549981C3F5F10" # Cortana
    "Microsoft.BingNews"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.People"
    "Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCamera"
    "Microsoft.WindowsCommunicationsApps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.WindowsStore" # Be cautious with removing the store
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
)

foreach ($app in $bloatware) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
}

# --- Section 3: Efficient Scripting Example (from provided text) ---
# This demonstrates best practices for data handling in PowerShell.

# Avoid += for better performance in loops.
# Use [pscustomobject] for cleaner and more efficient object creation.
$Output = foreach($Folder in Get-ChildItem -Directory -Path "C:\Your\Directory\To\Check" -Recurse -Force){
    $Acl = Get-Acl -Path $Folder.FullName
    foreach($Access in $Acl.Access){
        [pscustomobject]@{
            "Folder Name" = $Folder.FullName
            "Group/User"  = $Access.IdentityReference
            "Permissions" = $Access.FileSystemRights
            "Inherited"   = $Access.IsInherited
        }
    }
}

# Efficiently export to a CSV file.
$Output | Export-Csv -Path "C:\Path\To\Your\output.csv" -NoTypeInformation

Write-Host "Script execution completed."