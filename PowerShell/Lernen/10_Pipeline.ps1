# Get-Process | Sort-Object VM-desc | ConvertTo-Html | Out-File procs.html
#show vm# Get-Process | Sort-Object VM -Descending | Format-Table ProcessName, VM, CPU
# Get-Content.\modules.txt | Get-Command
<# "Microsoft.Powershell.Archive
Microsoft.Powershell.Management
Microsoft.Powershell.Utility" | Out-File modules.txt #>
#false# Get-Content .\modules.txt | Get-Command
<#Get-Content .\modules.txt | ForEach-Object {
    Get-Command -Module $_
} #>
# Get-Content .\modules.txt | Get-Member
# Get-Help Get-Command -Full
# Get-Content ./modules.txt | Get-Module 
# Get-Content ./modules.txt | Get-Module | Get-Member
#Stop-Process
# Get-Process | Sort-Object CPU -Descending | Stop-Process
# Get-ChildItem -File | Stop-Process -WhatIf
<#
"Name,Value
d,Get-ChildItem
sel,Select-Object
go,Invoke-Command" | Out-file aliases.txt
#>
# Import-Csv .\aliases.txt
# Import-Csv .\aliases.txt | Get-Member
# Import-Csv .\aliases.txt | New-Alias
<#
"login,dept,city,title
TylerL,It,Seattle,IT Engineer
JamesP,IT,Chattenooga,CTO
RobinL,Custodial,Denver,Janitor" | Out-File newusers.csv 
#>
<#
Import-Csv .\newusers.csv | 
select-object -property *,
    @{name='samAccountName';expression={$_.login}},
    @{label='Name';expression={$_.login}},
    @{n='Department';e={$_.Dept}} | 
new-aduser
#>
# Install-Module az
# Connect-AzAccount
# Connect-AzAccount -DeviceCode
# Get-AzContext
# Get-AzSubscription
# Get-Help Get-Command -Parameter module
# Get-Command -Module (Get-Content ./modules.txt)
# Get-Module -ListAvailable
# Get-AzResourceGroup -Location westus2
#New-AzStorageAccount -ResourceGroupName (Get-AzResourceGroup -Location wstus2| Select-Object -Fisrt1)
# -Name test0719 -SkuName Standart_ZRS -Location westus2
# Get-AzResourceGroup | Get-Member
# Get-AzResourceGroup -Location westus2 | Select-Object -First 1 -ExpandProperty ResourceGroupName
#New-AzStorageAccount -ResourceGroupName (Get-AzRescourceGroup -Location
#   westus2 | Select-Object -First 1 -ExpandProperty ResourceGroupName) 
#    -Name downloads -SkuName Stadard_LRS -Location westus2
# Get-AzResourceGroup -Location westus2 | Select-Object -First 1 
#    -Property ResourceGroupName
#(Get-AzResourceGroup -Location westus2 | Select-Object -Fisrt 1
# -Property ResourceGroupName) .GetType().Name

# 1. Yes looks good
#Get-Command -Module (Get-Module -ListAvailable -Name Microsoft.* | 
#Select-Object -ExpandProperty name)
#2.You cant pipe get-command to get-module
# Get-Module -ListAvailable -Name Microsoft.* | Get-Command 





