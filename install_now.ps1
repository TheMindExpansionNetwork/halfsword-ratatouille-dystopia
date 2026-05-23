# Ratatouille: Dystopia Edition - ONE CLICK INSTALL (ENABLES BY DEFAULT)
# Made specifically for people who hate manual steps.
# Run this as Administrator.

Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   RATATOUILLE: DYSTOPIA EDITION" -ForegroundColor Yellow
Write-Host "   ONE-CLICK INSTALL + AUTO ENABLE" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host ""

# Hardcoded for your PC
$gameRoot = "I:\SteamLibrary\steamapps\common\Half Sword"
$modsPath = "$gameRoot\HalfswordUE5\Binaries\Win64\UE4SS\Mods"
$iniPath  = "$gameRoot\HalfswordUE5\Binaries\Win64\UE4SS\UE4SS-settings.ini"

Write-Host "Installing to your exact path..." -ForegroundColor Cyan
Write-Host $modsPath -ForegroundColor White
Write-Host ""

# 1. Make sure UE4SS folder exists
if (-not (Test-Path $modsPath)) {
    Write-Host "ERROR: UE4SS is not installed at this location!" -ForegroundColor Red
    Write-Host "Please install UE4SS first into:" -ForegroundColor Yellow
    Write-Host $modsPath -ForegroundColor White
    Read-Host "Press Enter to exit"
    exit
}

# 2. Remove old version
$target = "$modsPath\KitchenMayhem"
if (Test-Path $target) {
    Remove-Item $target -Recurse -Force
}

# 3. Copy the mod (this is what makes the commands work)
Copy-Item ".\KitchenMayhem" -Destination $target -Recurse -Force
Write-Host "KitchenMayhem Lua mod installed." -ForegroundColor Green

# 4. FORCE ENABLE IN mods.txt (this is what you asked for - "enables default")
$modsTxt = "$modsPath\mods.txt"

# Create mods.txt if it doesn't exist
if (-not (Test-Path $modsTxt)) {
    New-Item -Path $modsTxt -ItemType File -Force | Out-Null
    Set-Content -Path $modsTxt -Value "CheatManager 0`n`n" -Encoding UTF8
}

# Read current content
$lines = Get-Content $modsTxt

# Remove any old KitchenMayhem line
$lines = $lines | Where-Object { $_ -notmatch "^KitchenMayhem" }

# Add it at the end, enabled by default (1 = on)
$lines += "KitchenMayhem 1"

# Save it
Set-Content -Path $modsTxt -Value $lines -Encoding UTF8
Write-Host "KitchenMayhem is now ENABLED BY DEFAULT in mods.txt" -ForegroundColor Green

# 5. Force console to work (GUI console + Debug)
if (Test-Path $iniPath) {
    $ini = Get-Content $iniPath -Raw

    # Enable Debug console
    if ($ini -match '\[Debug\]') {
        $ini = $ini -replace '(\[Debug\][^\[]*)', "[Debug]`nConsoleEnabled = true`n"
    } else {
        $ini += "`n[Debug]`nConsoleEnabled = true`n"
    }

    # Enable GUI console (opens a separate window - most reliable)
    if ($ini -match '\[GUI\]') {
        $ini = $ini -replace 'ConsoleEnabled\s*=\s*false', 'ConsoleEnabled = true'
    } else {
        $ini += "`n[GUI]`nConsoleEnabled = true`n"
    }

    Set-Content -Path $iniPath -Value $ini -Encoding UTF8
    Write-Host "Console auto-enabled (GUI + Debug)." -ForegroundColor Green
}

# 6. Install visual pak (extra pans & kitchen props in the world)
$paksTarget = "$gameRoot\HalfswordUE5\Content\Paks"
if (Test-Path ".\Paks") {
    if (-not (Test-Path $paksTarget)) {
        New-Item -Path $paksTarget -ItemType Directory -Force | Out-Null
    }
    Copy-Item ".\Paks\*" -Destination $paksTarget -Recurse -Force
    Write-Host "Visual kitchen props pak installed." -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   DONE! Mod is installed and ENABLED" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next:" -ForegroundColor Yellow
Write-Host "1. Completely close Half-Sword (use Task Manager)"
Write-Host "2. Start the game"
Write-Host "3. Press INSERT or F10 or ~ to open console"
Write-Host "4. Type:  KitchenDystopia"
Write-Host ""
Write-Host "The mod is now ON by default. No more editing mods.txt." -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to finish"