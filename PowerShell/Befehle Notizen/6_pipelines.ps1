# Get-Process pwsh | Select-Object Threads 
# (Get-Process -Name pwsh).Threads
# Get-Process | ConvertTo-Json | Out-File procs.json
# Get-Content ./procs.json | ConvertFrom-Json
# Get-Command *export*
# Get-ChildItem | Select-Object Name | Out-File process.txt
# help Compare-Object
# Get-Process | Export-CliXML reference.xml
# Compare-Object -Reference (Import-Clixml reference.xml) -Difference (Get-Process) -Property Name
# Compare-Object -Reference (Import-Clixml reference.xml) -Difference (Get-Process) 
# Dir > DirectoryList.txt
# Dir | Out-File DirectoryList.txt
# Help Out-String
# Get-Process -Id $PID | ConvertTo-Html | Out-File Test_html.txt
# Get-Process | Stop-Process
# $ConfirmPreference
# Get-Process PowerToys* | Stop-Process -Confirm
# Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 15
# Get-Process Microsoft.CmdPal.UI | Stop-Process -Confirm
# Get-Process SumatraPDF | Stop-Process -WhatIf
# Get-Process | Select-Object -First 5 | export-CSV processes.CSV -IncludeTypeInformation
# Get-Content ./processes.CSV
# Import-CSV ./processes.CSV #leserlicher

 
#1. Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 5 | Out-File cpu_top5.txt
#1. Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Last 5 | Out-File cpu_flop5.txt
#1. Compare-Object -Reference (Get-Content cpu_top5.txt) -Difference (Get-Content cpu_flop5.txt)
#2.Get-Command | Export-CSV commands.CSV | Out-File
#2. The Out-File is unnecessary, Export-CSV already saves the the file.
<#3. Get-Help Stop-Job -Examples
# here are some examples 
  ```powershell
    Stop-Job -Name "Job1"
    ```

    This command stops the `Job1` background job.

     --------- Example 3: Stop several background jobs ---------

    ```powershell
    Stop-Job -Id 1, 3, 4
    ```

    This command stops three jobs. It identifies them by their **IDs**.

     --------- Example 4: Stop all background jobs ---------

    ```powershell
    Get-Job | Stop-Job
    ```

    This command stops all of the background jobs in the current session.

     --------- Example 5: Stop all blocked background jobs ---------

    ```powershell
    Stop-Job -State Blocked
    ```

    This command stops all the jobs that are blocked.

     --------- Example 6: Stop a job by instance ID ---------

    ```powershell
    Get-Job | Format-Table ID, Name, Command, @{Label="State";Expression={$_.JobStateInfo.State}},    
    InstanceId -Auto
    ```
# yes you can use it without Get-Job
#3. $s = New-PSSession -ComputerName Server01 -Credential Domain01\Admin02
#3. $j = Invoke-Command -Session $s -ScriptBlock {Start-Job -ScriptBlock {Get-EventLog -LogName 
#3. System}}
#3. Invoke-Command -Session $s -ScriptBlock { Stop-Job -Job $Using:j }
#>
#4. Get-Process | Select-Object -First 5 | Export-CSV processes.CSV -Delimiter '|'
#5. Get-Process | Select-Object -First 5 | Export-CSV processes2.CSV -IncludeTypeInformation
#6. For not overwriting -Append,-NoClobber and to confirm -Confirm
#7. -UseCulture 


