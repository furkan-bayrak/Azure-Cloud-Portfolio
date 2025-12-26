# 'hello' | gm
# Ein 'property' contained immer einen 'value'.
# Get-Process | Sort-Object CPU,ID -desc
# Get-Process | ConvertTo-HTML | Out-File test1.html
# Get-Process | Select-Object -Property Name,ID,CPU,PM | ConvertTO-Html | Out-File test2.html -Verbose
# Get-Process | Select NAme,ID,CPU,PM | ConvertTo-HTML | Out-File test3.html
# Get-Process | Select CPU
# Get-Process | Sort-Object CPU -Descending | Out-File C:\Users\furka\Desktop\procs.txt
# Get-Process | Sort-Object CPU -Descending | Select-Object Name,ID,CPU
# Get-Process | Sort-Object CPU -Descending | Get-Member
# Get-Process | Sort-Object CPU -Descending | Select-Object Name,ID,CPU | Get-Member
# gps | gm | gm

# 1.
# Get-Command *random*
# Get-Help Get-Random -Full
# Get-Random

#2. 
# Get-Help *date*
# Get-Date

#3.
# Get-Date | gm
# TypeName: System.DateTime

#4. 
# Get-Date | Select-Object DayOfWeek

#5.
# Get-ChildItem

#6. 
# cd -Path 'C:\Users\furka\Desktop'
# ls | Sort-Object CreationTime | select name, CreationTime

#7.
<#
Get-ChildItem | Sort-Object LastWriteTime | 
Select-Object filename, CreationTime, LastWriteTime |
Out-File data.html
#>
Get-ChildItem | Sort-Object LastWriteTime | 
Select-Object filename, CreationTime, LastWriteTime |
Export-CSV data2.csv
