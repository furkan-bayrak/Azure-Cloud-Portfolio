# Register-PSRepository
# (Find-Module).COUNT ## 11.769
# (Get-Content Env:/PSModulePath) -split ':'
# help *-archive
# Get-Command -Module Microsoft.PowerShell.Archive
# Get-Help Compress-Archive
# 'test lunch' | Out-File chapter7.txt
# Compress-Archive -Path .\chapter7.txt -DestinationPath .\chapter7.zip
# Compress-Archive -Path .\chapter7.txt -DestinationPath .\chapter7.zip -Force -Verbose

#1. Install-Module -Name PowerShellGet -AllowPrerelease -Force
#1. Install-Module -Name PSReadLine -AllowPrerelease -Verbose
#2. Get-Help PowerShellGet -Full
<#2. 
Import-Module                     Cmdlet    Microsoft.PowerShell.Core Adds modules to the current s… 
New-ModuleManifest                Cmdlet    Microsoft.PowerShell.Core Creates a new module manifest. 
Invoke-RestMethod                 Cmdlet    Microsoft.PowerShell.Uti… Sends an HTTP or HTTPS reques… 
Update-TypeData                   Cmdlet    Microsoft.PowerShell.Uti… Updates the extended type dat… 
Find-PackageProvider              Cmdlet    PackageManagement         Returns a list of Package Man… 
Get-Package                       Cmdlet    PackageManagement         Returns a list of all softwar… 
Get-PackageSource                 Cmdlet    PackageManagement         Gets a list of package source… 
Install-Package                   Cmdlet    PackageManagement         Installs one or more software… 
Install-PackageProvider           Cmdlet    PackageManagement         Installs one or more Package … 
Uninstall-Package                 Cmdlet    PackageManagement         Uninstalls one or more softwa… 
about_Logging_Non-Windows         HelpFile
about_Modules                     HelpFile
about_PowerShell_Config           HelpFile
about_PSModulePath                HelpFile
about_Requires                    HelpFile
#>
### Right: Get-Command -Module PowershellGet

#3. Find-Module *Archive*
#3. Install-Module -Name Microsoft.PowerShell.Archive 
### Right: Find-Module -Command Compress-Archive |Install-Module -Force

#4. Get-Module Microsoft.PowerShell.Archive
### Right: Import-Module Microsoft.PowerShell.Archive

#5. md 'Testfolder'
#5. New-Item -ItemType 'File' -Path 'C:\Users\furka\VS Code\PowerShell\Testfolder\1.txt', 'C:\Users\furka\VS Code\PowerShell\Testfolder\2.txt', 
#5. 'C:\Users\furka\VS Code\PowerShell\Testfolder\3.txt',  'C:\Users\furka\VS Code\PowerShell\Testfolder\4.txt',  'C:\Users\furka\VS Code\PowerShell\Testfolder\5.txt',  
#5. 'C:\Users\furka\VS Code\PowerShell\Testfolder\6.txt',  'C:\Users\furka\VS Code\PowerShell\Testfolder\7.txt', 'C:\Users\furka\VS Code\PowerShell\Testfolder\8.txt',
#5. 'C:\Users\furka\VS Code\PowerShell\Testfolder\9.txt',  'C:\Users\furka\VS Code\PowerShell\Testfolder\10.txt'
### Right: New-Item ~/TestFolder -ItemType Directory 1..10 | ForEach-Object {New-Item "~/TestFolder/$_.txt" -ItemType File -Value $_}

#6. Compress-Archive -Path 'C:\Users\furka\VS Code\PowerShell\Testfolder' -DestinationPath 'C:\Users\furka\VS Code\PowerShell\Testfolder.zip'
### Compress-Archive ~/TestFolder/* -DestinationPath ~/TestFolder.zip

#7. Expand-Archive -Path Testfolder.zip -DestinationPath 'C:\Users\furka\VS Code\PowerShell\Testfolder2'
<#8.
$objects = @{
    ReferenceObject = Get-ChildItem -Path 'C:\Users\furka\VS Code\PowerShell\Testfolder' | Select-Object -ExpandProperty Name
    DifferenceObject = Get-ChildItem -Path 'C:\Users\furka\VS Code\PowerShell\Testfolder2' | Select-Object -ExpandProperty Name
}

Compare-Object @objects
#>
### Get-ChildItem.$reference = Get-ChildItem ~/
TestFolder| Select-Object -
ExpandProperty name
$difference = Get-ChildItem ~/
TestFolder3| Select-Object -
ExpandProperty name
Compare-Object -ReferenceObject
$reference -DifferenceObject
$difference
