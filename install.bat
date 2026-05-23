@echo off
echo ========================================
echo    RATATOUILLE: DYSTOPIA EDITION
echo    Anyone Can Cook... In the Apocalypse
echo ========================================
echo.

set "defaultPath=C:\Program Files (x86)\Steam\steamapps\common\Half Sword\HalfswordUE5\Binaries\Win64\UE4SS\Mods"

echo Default Half-Sword UE4SS Mods path:
echo %defaultPath%
echo.

set /p path="Press Enter to use default, or paste your full UE4SS\Mods path: "
if "%path%"=="" set path=%defaultPath%

set "target=%path%\KitchenMayhem"

if exist "%target%" (
    echo Existing KitchenMayhem folder found. Removing old version...
    rmdir /s /q "%target%"
)

echo Copying KitchenMayhem mod (the dystopian chef Lua)...
xcopy /E /I /Y ".\KitchenMayhem" "%target%"

:: === Visual Paks support ===
if exist ".\Paks" (
    echo.
    echo Found Paks/ - deploying kitchen visual props...
    set "halfswordRoot=%path%"
    for /L %%i in (1,1,4) do set "halfswordRoot=%%~dphalfswordRoot..\"
    set "paksTarget=%halfswordRoot%Content\Paks"
    if not exist "%paksTarget%" mkdir "%paksTarget%"
    echo Copying RatatouilleVisuals_Demo.pak to %paksTarget% ...
    xcopy /E /I /Y ".\Paks\*" "%paksTarget%"
    echo Pans, plates & props deployed, chef! More kitchen chaos in the world.
)

echo.
echo ========================================
echo    INSTALLATION COMPLETE, CHEF
echo ========================================
echo.
echo Next steps:
echo 1. Launch Half-Sword
echo 2. Open the console (usually ~ or Insert key)
echo 3. Type: KitchenDystopia   (or ChefApocalypse)  -- full dystopia mode + visuals active
echo.
echo Remember: Anyone can cook. Not everyone survives.
echo.
pause