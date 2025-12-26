# Get-Help Get-ComputerInfo -Examples
# Get-Help Out-File -Examples
# Get-ComputerInfo | Out-File -Filepath C:\Users\furka\Desktop\specs.txt
# Get-Command *computer*
# Get-Help Get-Help -Parameter *
# Help about_CommonParameters 
# help about_Updatable_Help
# Help Get-Item -Online
### Update-Help -UICulture en-US -Force -ErrorAction SilentlyContinue
# 2. Get-Command *html* ## ConvertTo-Html
# Get-Command *file
# Get-Help Write-Output -Examples
# Get-Help Out-File -Examples
## 4. (Get-Command *process*).Count ##15
# Get-Command *breakpoint*
## 5. Help Set-PSBreakpoint 
## 6. Get-Command *Alias* ## Export-Alias, Get-Alias, Import-Alias, New-Alias, Remove-Alias, Set-Alias  
# 7. Help Start-Transcript -Examples
# Start-Transcript -Path '.\Desktop\PStranscript.txt'
# Get-Help Get-Process -Name -Examples
# 8. Get-Process explorer ##einfach den Namen im String
# Get-Process -IncludeUserName
# 9. Get-Process -Name pwsh -IncludeUserName
# Get-Help Invoke-Command -Examples
# 10. Invoke-Command -ComputerName Server01 -ScriptBlock {Get-Culture}
# help Out-File
# 11. default 80.
# 11. Get-Process | Out-File 'C:\Users\furka\Desktop\WidthTest2.txt' -Width 30
# Get-Help Out-File -Parameter *
# 12. -Append , -NoClobber
# 13. Get-Alias
# Get-Alias *clear*
# Help New-Alias -Examples
# New-Alias "c" Clear-Host
# 14. gcm *proce*
# 15. . (Get-Command *object*).COUNT ## 11
# 16. Help about_Arrays
# Get-Command -Noun file,printer
