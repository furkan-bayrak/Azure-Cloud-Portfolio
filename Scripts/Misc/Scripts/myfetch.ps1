function Get-MyFetch {
    # --- Color Definitions (Matched to Pop!_OS screenshot) ---
    $esc = "$([char]27)"
    $ansiArtColor = "${esc}[36m"      # Cyan
    $ansiHighlight = "${esc}[36m"     # Cyan (for the labels like OS:)
    $ansiInfo = "${esc}[97m"          # Bright White (for the values)
    $ansiUser = "${esc}[36;1m"        # Bright Cyan, Bold
    $ansiReset = "${esc}[0m"          # Resets all color and formatting

    # --- ASCII Art Section ---
    # You can replace the text between @' and '@ with any art you want.
    # The single quotes are important to make it work correctly.
    $asciiArt = @'
       .
      ":"
    ___:____     |"\/"|
  ,'        `.    \  /
  |  O        \___/  |
~^~^~^~^~^~^~^~^~^~^~^~^~
'@

    # --- System Information ---
    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
    $cpuInfo = Get-CimInstance -ClassName Win32_Processor
    $gpuInfo = @(Get-CimInstance -ClassName Win32_VideoController)[0] # Take first GPU
    $csInfo = Get-CimInstance -ClassName Win32_ComputerSystem
    
    # --- Gather Information ---
    $userName = "$($env:USERNAME)@$($env:COMPUTERNAME)"
    $os = $osInfo.Caption
    $kernel = $osInfo.Version
    $hostName = $csInfo.Name
    $uptimeSpan = (Get-Date) - $osInfo.LastBootUpTime
    $uptime = "$($uptimeSpan.Days)d $($uptimeSpan.Hours)h $($uptimeSpan.Minutes)m"
    $shell = "PowerShell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"
    $resolution = "$($gpuInfo.CurrentHorizontalResolution)x$($gpuInfo.CurrentVerticalResolution)"
    $de = "Explorer"
    $wm = "DWM" # Desktop Window Manager
    $terminal = if ($env:TERM_PROGRAM) { $env:TERM_PROGRAM } else { "conhost.exe" }
    
    $cpu = $cpuInfo.Name -replace '(\(R\)|\(TM\)|CPU)','' -replace '@ .*','' | ForEach-Object { $_.Trim() }
    
    $gpu = $gpuInfo.Name -replace '\(R\)',''
    $totalMemGB = [math]::Round($csInfo.TotalPhysicalMemory / 1GB, 1)
    $usedMemGB = [math]::Round(($csInfo.TotalPhysicalMemory - $osInfo.FreePhysicalMemory * 1024) / 1GB, 1)
    $mem = "${usedMemGB}GB / ${totalMemGB}GB"

    # --- Create the Color Bar ---
    $c = $esc # shorthand
    $colorBar = "  ${c}[40m  ${c}[41m  ${c}[42m  ${c}[43m  ${c}[44m  ${c}[45m  ${c}[46m  ${c}[47m  ${c}[0m"

    # --- Construct Info Lines ---
    $infoData = [ordered]@{
        "OS"         = $os
        "Host"       = $hostName
        "Kernel"     = $kernel
        "Uptime"     = $uptime
        "Shell"      = $shell
        "Resolution" = $resolution
        "DE"         = $de
        "WM"         = $wm
        "Terminal"   = $terminal
        "CPU"        = $cpu
        "GPU"        = $gpu
        "Memory"     = $mem
    }

    $infoLines = @(
        "${ansiUser}${userName}${ansiReset}",
        "$($ansiInfo)------------------${ansiReset}" # Separator line
    )
    foreach ($key in $infoData.Keys) {
        $label = ($key + ":").PadRight(13)
        $infoLines += "${ansiHighlight}$label${ansiInfo}$($infoData[$key])${ansiReset}"
    }

    $infoLines += "" # Blank line
    $infoLines += $colorBar

    # --- Combine and Print with Side-by-Side Alignment ---
    $asciiLines = $asciiArt.Split([System.Environment]::NewLine)
    $artWidth = ($asciiLines | Measure-Object -Property Length -Maximum).Maximum
    $spacer = "   "

    $lineCount = [Math]::Max($asciiLines.Count, $infoLines.Count)

    for ($i = 0; $i -lt $lineCount; $i++) {
        $artLine = if ($i -lt $asciiLines.Count) { $asciiLines[$i] } else { "" }
        $infoLine = if ($i -lt $infoLines.Count) { $infoLines[$i] } else { "" }
        $paddedArtLine = $artLine.PadRight($artWidth)
        Write-Host "${ansiArtColor}${paddedArtLine}${ansiReset}${spacer}${infoLine}"
    }
}