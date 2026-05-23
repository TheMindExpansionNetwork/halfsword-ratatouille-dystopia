# Fix UE4SS Console for Half-Sword on I: drive
# Run this as Administrator in PowerShell

$ue4ssIni = "I:\SteamLibrary\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\UE4SS-settings.ini"

if (-not (Test-Path $ue4ssIni)) {
    Write-Host "UE4SS-settings.ini not found at expected path!" -ForegroundColor Red
    Write-Host "Make sure UE4SS is installed in the correct location." -ForegroundColor Yellow
    Read-Host "Press Enter"
    exit
}

Write-Host "Found UE4SS settings. Fixing console..." -ForegroundColor Green

$content = Get-Content $ue4ssIni -Raw

# Ensure Debug section has ConsoleEnabled
if ($content -notmatch '\[Debug\]') {
    $content += "`n[Debug]`nConsoleEnabled = true`n"
} elseif ($content -notmatch 'ConsoleEnabled\s*=\s*true') {
    $content = $content -replace '(\[Debug\][^\[]*)', "`$1`nConsoleEnabled = true`n"
}

# Add/ensure GUI console (most reliable way to see output)
if ($content -notmatch '\[GUI\]') {
    $content += "`n[GUI]`nConsoleEnabled = true`n"
} else {
    $content = $content -replace 'ConsoleEnabled\s*=\s*false', 'ConsoleEnabled = true' 
}

Set-Content -Path $ue4ssIni -Value $content -Encoding UTF8

Write-Host "Console settings fixed!" -ForegroundColor Green
Write-Host ""
Write-Host "Now:" -ForegroundColor Yellow
Write-Host "1. Close Half-Sword completely"
Write-Host "2. Start the game"
Write-Host "3. When game is running, look for a SEPARATE small window titled something like 'UE4SS Console' or OpenGL window"
Write-Host "4. In that window or in game, try these keys one by one:"
Write-Host "   - Insert"
Write-Host "   - F10"
Write-Host "   - ~ (tilde key, usually above Tab)"
Write-Host ""
Write-Host "If you see a separate console window, type 'KitchenDystopia' in it." -ForegroundColor Cyan
Read-Host "Press Enter when done"