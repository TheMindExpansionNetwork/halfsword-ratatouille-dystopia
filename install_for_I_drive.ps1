# Ratatouille: Dystopia Edition - CUSTOM INSTALLER FOR YOUR I: DRIVE
# This version is hardcoded for your exact path so it can't go wrong.

Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   RATATOUILLE: DYSTOPIA EDITION" -ForegroundColor Yellow
Write-Host "   CUSTOM INSTALLER FOR YOUR PC" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host ""

# Your exact path (hardcoded)
$modsPath = "I:\SteamLibrary\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods"

Write-Host "Using your path:" -ForegroundColor Cyan
Write-Host $modsPath -ForegroundColor White
Write-Host ""

# Check if the UE4SS folder even exists
if (-not (Test-Path $modsPath)) {
    Write-Host "ERROR: I cannot find the UE4SS Mods folder at that path!" -ForegroundColor Red
    Write-Host "Please make sure UE4SS is installed first." -ForegroundColor Red
    Write-Host "Expected location: $modsPath" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit
}

$target = Join-Path $modsPath "KitchenMayhem"

# Remove old version if it exists
if (Test-Path $target) {
    Write-Host "Found old KitchenMayhem folder. Removing it first..." -ForegroundColor Yellow
    Remove-Item $target -Recurse -Force
}

# Copy the mod
Write-Host "Installing KitchenMayhem (the Lua commands)..." -ForegroundColor Green
Copy-Item -Path ".\KitchenMayhem" -Destination $target -Recurse -Force
Write-Host "Lua mod installed successfully." -ForegroundColor Green

# === Visual Paks ===
$paksSource = ".\Paks"
if (Test-Path $paksSource) {
    Write-Host ""
    Write-Host "Installing visual props pak (extra pans & kitchen stuff)..." -ForegroundColor Cyan
    
    $gameRoot = "I:\SteamLibrary\steamapps\common\Half Sword\HalfswordUE5"
    $paksTarget = Join-Path $gameRoot "Content\Paks"
    
    if (-not (Test-Path $paksTarget)) {
        New-Item -ItemType Directory -Path $paksTarget -Force | Out-Null
    }
    
    Copy-Item -Path "$paksSource\*" -Destination $paksTarget -Recurse -Force
    Write-Host "Visual pak installed to Content\Paks\" -ForegroundColor Green
}

# === Force enable in mods.txt ===
$modsTxt = Join-Path $modsPath "mods.txt"
if (Test-Path $modsTxt) {
    $content = Get-Content $modsTxt
    if ($content -notmatch "KitchenMayhem") {
        Add-Content -Path $modsTxt -Value "KitchenMayhem 1"
        Write-Host "Added KitchenMayhem to mods.txt (enabled)" -ForegroundColor Green
    } else {
        Write-Host "KitchenMayhem was already in mods.txt" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   INSTALLATION COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Completely close Half-Sword (check Task Manager)"
Write-Host "2. Start the game again"
Write-Host "3. Open console with ~ or Insert"
Write-Host "4. Type:  KitchenDystopia"
Write-Host ""
Write-Host "You should see messages like [CHEF APOCALYPSE] when it works." -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to finish"