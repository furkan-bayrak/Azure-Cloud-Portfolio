#1. New-Item -Path 'C:\Users\furka\Desktop' -Name 'Labs' -Type Directory
#2. New-Item -Path 'C:\Users\furka\Desktop\Labs' -Name 'Test.txt' -Type 'File'
#3. Set-Item -Path 'C:\Users\furka\Desktop\Labs\Test.txt' -Value '-TESTING'
#3. It does not work because Set-Item can't write into files.
#4. Get-Item -Path Env:
## better solution: Get-Item env:PATH
#5. Get-help Get-ChildItem -full

<# 5.
Exclude [<System.String[]>]
        Specifies, as a string array, an item or items that this cmdlet excludes in the operation.   
        The value
        of this parameter qualifies the **Path** parameter. Enter a path element or pattern, such as 
        `*.txt`. Wildcard characters are permitted. The **Exclude** parameter is effective only      
        when the
        command includes the contents of an item, such as `C:\Windows\*`, where the wildcard
        character
        specifies the contents of the `C:\Windows` directory.

-Filter [<System.String>]
        Specifies a filter to qualify the **Path** parameter. The
        [FileSystem](../Microsoft.PowerShell.Core/About/about_FileSystem_Provider.md) provider is 
        the only
        installed PowerShell provider that supports filters. Filters are more efficient than other   
        parameters. The provider applies filter when the cmdlet gets the objects rather than having  
        PowerShell filter the objects after they're retrieved. The filter string is passed to the    
        .NET API
        to enumerate files. The API only supports `*` and `?` wildcards.

Include [<System.String[]>]
        Specifies, as a string array, an item or items that this cmdlet includes in the operation.   
        The value
        of this parameter qualifies the **Path** parameter. Enter a path element or pattern, such as 
        `*.txt`. Wildcard characters are permitted. The **Include** parameter is effective only      
        when the
        command includes the contents of an item, such as `C:\Windows\*`, where the wildcard
        character
        specifies the contents of the `C:\Windows` directory.
#>

Dir env:PATH