# Ratatouille: Dystopia Edition - Simple Installer for Half-Sword
# Run this as Administrator if it complains about permissions.

Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   RATATOUILLE: DYSTOPIA EDITION" -ForegroundColor Yellow
Write-Host "   Anyone Can Cook... In the Apocalypse" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host ""

$defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods"

Write-Host "Default Half-Sword UE4SS Mods path:" -ForegroundColor Cyan
Write-Host $defaultPath
Write-Host ""

$path = Read-Host "Press Enter to use default, or paste your full UE4SS\Mods path"

if ([string]::IsNullOrWhiteSpace($path)) {
    $path = $defaultPath
}

$target = Join-Path $path "KitchenMayhem"

if (Test-Path $target) {
    Write-Host "Existing KitchenMayhem folder found. Removing old version..." -ForegroundColor Yellow
    Remove-Item $target -Recurse -Force
}

Write-Host "Copying KitchenMayhem mod (the dystopian chef Lua)..." -ForegroundColor Green
Copy-Item -Path ".\KitchenMayhem" -Destination $target -Recurse -Force

# === Visual Paks: starter prop overrides (pans, pots, kitchen clutter) ===
$paksSource = ".\Paks"
if (Test-Path $paksSource) {
    Write-Host ""
    Write-Host "Found Paks/ - deploying kitchen visual props..." -ForegroundColor Cyan
    # Derive HalfswordUE5 root: from Mods path, go up 4 parents to reach HalfswordUE5
    $halfswordRoot = $path
    for ($i = 0; $i -lt 4; $i++) {
        $halfswordRoot = Split-Path $halfswordRoot -Parent
    }
    $paksTarget = Join-Path $halfswordRoot "Content" "Paks"
    if (-not (Test-Path $paksTarget)) {
        New-Item -ItemType Directory -Path $paksTarget -Force | Out-Null
    }
    Write-Host "Copying RatatouilleVisuals_Demo.pak to $paksTarget ..." -ForegroundColor Green
    Copy-Item -Path "$paksSource\*" -Destination $paksTarget -Recurse -Force
    Write-Host "Pans, plates & props deployed, chef! More kitchen chaos in the world." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   INSTALLATION COMPLETE, CHEF" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor DarkRed
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Launch Half-Sword"
Write-Host "2. Open the console (usually ~ or Insert key)"
Write-Host "3. Type: KitchenDystopia   (or ChefApocalypse)  -- full dystopia mode + visuals active"
Write-Host ""
Write-Host "Remember: Anyone can cook. Not everyone survives." -ForegroundColor Magenta
Write-Host ""
Read-Host "Press Enter to exit"