Add-Type -AssemblyName System.Windows.Forms
$w = New-Object -ComObject WScript.Shell

while ($true) {
    # 1. Enforce NumLock to be ALWAYS ON
    # If NumLock is NOT on, press it.
    if (-not [System.Windows.Forms.Control]::IsKeyLocked('NumLock')) {
        $w.SendKeys('{NUMLOCK}')
    }

    # 2. Enforce CapsLock to be ALWAYS OFF
    # If CapsLock IS on, press it to turn it off.
    if ([System.Windows.Forms.Control]::IsKeyLocked('CapsLock')) {
        $w.SendKeys('{CAPSLOCK}')
    }

    # Wait 1 second before checking again
    Start-Sleep -Seconds 1
}