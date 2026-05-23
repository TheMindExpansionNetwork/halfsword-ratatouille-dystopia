Write-Host "========================================" -ForegroundColor DarkRed
Write-Host "   RATATOUILLE: DYSTOPIA EDITION" -ForegroundColor Yellow
Write-Host "   Anyone Can Cook... In the Apocalypse" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor DarkRed

$defaultPath = "C:\Program Files (x86)\Steam\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods"

Write-Host "Default path: $defaultPath"
$path = Read-Host "Press Enter for default or paste your UE4SS\Mods path"

if ([string]::IsNullOrWhiteSpace($path)) { $path = $defaultPath }

$target = Join-Path $path "KitchenMayhem"

if (Test-Path $target) { Remove-Item $target -Recurse -Force }

Copy-Item -Path ".\KitchenMayhem" -Destination $target -Recurse -Force

Write-Host "Installation complete! Type KitchenDystopia in game." -ForegroundColor Green