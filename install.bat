@echo off
echo RATATOUILLE: DYSTOPIA EDITION
echo Installing...
set "default=C:\Program Files (x86)\Steam\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods"
set /p path="Press Enter for default or type path: "
if "%path%"=="" set path=%default%
xcopy /E /I /Y "KitchenMayhem" "%path%\KitchenMayhem"
echo Done. Type KitchenDystopia in game.
pause