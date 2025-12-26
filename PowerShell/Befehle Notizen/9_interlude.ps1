# Get-Help *YAML*
# Get-Command -noun *YAML*
# Find-Module *YAML* | Format-Table -auto 
# install-module powershell-yaml #didnt work
# Install-Module powershell-yaml -SkipPublisherCheck -Force
# Help ConvertFrom-Yaml
# Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/PowerShell/PowerShell/master/.vsts-ci/templates/credscan.yml' -Outfile 'credscan.yml'
# Get-Content -Raw .\credscan.yml
# Get-Content -Raw .\credscan.yml | ConvertFrom-Yaml
# Get-Content -Raw .\credscan.yml | ConvertFrom-Yaml | gm
# Get-Help *json*
# Get-Content -Raw .\credscan.yml | ConvertFrom-Yaml | ConvertTo-Json -Depth 100

## 9.5 Lab
# find-module *SecretManagement*  | Format-Table -auto 
# install-module Microsoft.PowerShell.SecretManagement -SkipPublisherCheck -Force
# Get-Command -Module SecretManagement.Windows.LAPS
#find-module *store*  | Format-Table -auto 
# install-module Store -SkipPublisherCheck -Force
# Get-Command -Module store
# Get-Command -Module Microsoft.PowerShell.SecretManagement
# Help Register-SecretVault -Examples
# Register-SecretVault -Name LocalStore -ModuleName Microsoft.PowerShell.SecretStore  -DefaultVault
# Get-SecretVault
# Set-Secret -Name "Hallo" -Secret "Tschö"
# Get-Secret -Name "Hallo"
# Get-Secret -Name "Hallo" -AsPlainText
