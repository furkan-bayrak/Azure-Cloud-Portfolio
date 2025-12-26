<#
.SYNOPSIS
    Auto-organises C:\Users\furka\Downloads into sub-folders named after
    each file extension (e.g. jpg, pdf, docx, …).

.DESCRIPTION
    • Works only on  C:\Users\furka\Downloads
    • Creates a folder for every extension it finds (e.g. “jpg”, “pdf”)
    • Moves the files into the matching folder
    • Prints a summary afterwards
#>

# ------------------------------------------------------------------
# 1. Target folder
# ------------------------------------------------------------------
$downloadsDir = 'C:\Users\furka\Downloads'

if (-not (Test-Path -LiteralPath $downloadsDir -PathType Container)) {
    Write-Host "The folder '$downloadsDir' does not exist – nothing to do."
    return
}

# ------------------------------------------------------------------
# 2. Collect files grouped by extension (without the dot)
# ------------------------------------------------------------------
$stats = @{}   # extension -> count

Get-ChildItem -LiteralPath $downloadsDir -File |
    Group-Object -Property { $_.Extension.TrimStart('.').ToLower() } |
    ForEach-Object {
        $ext        = $_.Name          # e.g. "jpg"
        $files      = $_.Group         # all *.jpg files
        $destFolder = Join-Path -Path $downloadsDir -ChildPath $ext

        # Create folder if missing
        if (-not (Test-Path -LiteralPath $destFolder -PathType Container)) {
            $null = New-Item -ItemType Directory -Path $destFolder -Force
        }

        # Move every file into that folder
        foreach ($file in $files) {
            Move-Item -LiteralPath $file.FullName -Destination $destFolder
            $stats[$ext]++
        }
    }

# ------------------------------------------------------------------
# 3. Summary
# ------------------------------------------------------------------
if ($stats.Count -eq 0) {
    Write-Host "`nNo recognised files to move in '$downloadsDir'."
}
else {
    Write-Host "`nOrganisation complete for '$downloadsDir':`n"
    $stats.GetEnumerator() | Sort-Object Name | ForEach-Object {
        $plural = if ($_.Value -eq 1) { '' } else { 's' }
        Write-Host ("  {0} : {1} file{2} moved" -f $_.Key, $_.Value, $plural)
    }
}