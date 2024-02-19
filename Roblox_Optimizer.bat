:menu
@echo off
cls
setlocal enabledelayedexpansion
mode con:cols=140 lines=35
echo.
echo Welcome To Roblox Optimizer. In this tool you can optimize your roblox easier.
echo.
echo    [ O ] Optimizer Menu     [ R ] Reinstall Roblox     [ S ] Start Roblox     [ F ] Roblox Folder     [ C ] Change ClientAppSettings
echo.
echo    [ ST ] Settings     [ L ] Updates Logs
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "O" goto OptimizeRobloxMenu
if /I "%C%" EQU "R" goto ReinstallRobloxMenu
if /I "%C%" EQU "S" goto StartRoblox
if /I "%C%" EQU "F" goto OpenRobloxFolder
if /I "%C%" EQU "C" goto ClientSettingsSection
if /I "%C%" EQU "ST" goto SettingsPage
if /I "%C%" EQU "L" goto UpdatesLogs
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto menu





:UpdatesLogs
cls
echo Version: & type "C:\Program Files\ROTWEOptimizer\Version.txt"
echo.
echo Updates Logs:
echo -------------------------------------
echo Fixed some errors
echo.
echo Improved Code
echo -------------------------------------
echo Wrong Version? Please Update The Program Again Or Repair
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto menu





:OpenRobloxFolder
cls
echo.
echo Scanning  Your Drive...
for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
start explorer.exe "%%~dpi"
	goto menu
)
	goto menu



:StartRoblox
cls
echo.
echo Starting Roblox...
for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    start "" "%%i"
)
goto menu




:ReinstallRobloxMenu
cls
echo.
echo Page: Roblox Reinstallation
echo.
echo You Can Use This To Reinstall Roblox, This Program Will Delete All The Files Exist, And Some Registry Keys
echo.
echo This May Fix Some Issues That You Have On Roblox.
echo -------------------------------------
echo [ R ] Reinstall roblox
echo.
echo [ B ] Go Back
echo -------------------------------------
set /p c=Enter Your Input: 
if /I "%C%" EQU "R" goto ReinstallRoblox
if /I "%C%" EQU "B" goto Menu
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto ReinstallRobloxMenu





:ReinstallRoblox
timeout /t 1 /nobreak>nul
cls
echo.
echo Preparing...
timeout /t 2 /nobreak>nul
rmdir /q /s "%localappdata%\temp\ROTWETemp" > NUL 2>&1
del /q /s /f "%localappdata%\temp" > NUL 2>&1
cd "%localappdata%\temp"
mkdir "ROTWETemp" > NUL 2>&1

goto DownloadRobloxInstaller





:DownloadRobloxInstaller
cls
echo.
echo Downloading Roblox Installer...
cd "%localappdata%\temp\ROTWETemp"
powershell -command Invoke-WebRequest -URI "https://www.roblox.com/download/client" -OutFile RobloxPlayrInstaller.exe > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo An Error Occured When Downloading The Installer, The Action Has Been Stopped
    echo.
    echo If This Error Still Persist, Please Report This By Messaging Me On Discord: _hzp
    timeout /t 2 /nobreak>nul
    echo.
    echo [ Press Any Key To Continue ]
    pause>nul
    goto Menu
)

goto DeleteRobloxFolderForReinstallation


:DeleteRobloxFolderForReinstallation

rem Backing Up Roblox In Case If There's Server Errors or Connection Problem. If It Successfully Completed It Will Deletes The Back Up Folder
    
    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    cd "%localappdata\temp\ROTWETemp" > NUL 2>&1
    mkdir "OldRobloxFolder" > NUL 2>&1
    timeout /t 1 /nobreak>nul
    move /y "%%~dpi" "%localappdata%\temp\ROTWETemp\OldRobloxFolder" > NUL 2>&1
)
    

    rem Deletes Roblox Stuff
    cd "%localappdata%\temp\ROTWETemp"
    cls
    echo.
    echo Uninstalling Roblox...
    timeout /t 2 /nobreak>nul
    rmdir /q /s "C:\ProgramData\Roblox-Player" > NUL 2>&1
    del /q /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Roblox\Roblox Player" > NUL 2>&1
    del /q /f "%userprofile%\Desktop\Roblox Player" > NUL 2>&1
    reg delete "HKEY_CURRENT_USER\SOFTWARE\Roblox" /f > NUL 2>&1
    reg delete "HKEY_CURRENT_USER\SOFTWARE\Roblox Corporation" /f > NUL 2>&1
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f > NUL 2>&1
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox\Roblox Corporation" /f > NUL 2>&1
    

for /f "delims=" %%i in ('dir /s /b "C:\Program Files(x86)\Roblox\RobloxPlayerBeta.exe" 2^>NUL') do (
    rmdir /q /s "%%~dpi" > NUL 2>&1
)


for /f "delims=" %%j in ('dir /s /b "%localappdata%\Roblox\RobloxPlayerBeta.exe" 2^>NUL') do (
    rmdir /q /s "%%~dpj" > NUL 2>&1
)

for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%%~dpiRobloxPlayerBeta.exe" /f
)
goto StartRobloxInstaller




:StartRobloxInstaller

rem Error Handling:
if exist "%localappdat\temp\ROTWETemp\RobloxPlayerInstaller.exe" (
    cls
    echo.
    echo Reinstalling...
    cd "%localappdata%\temp\ROTWETemp"
    start /min /wait RobloxPlayerInstaller.exe > NUL 2>&1
    timeout /t 2 /nobreak>nul
    taskkill /f /im "RobloxPlayerBeta.exe" > NUL 2>&1

    goto ReinstallationComplete
   
)

cls
echo.
echo The Installer Is Not Downloaded Correctly. Do You Want To Try Again?
echo.
echo [ Y ] Yes  [ N ] No
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "Y" goto DownloadRobloxInstallerBackup
if /I "%C%" EQU "N" goto DownloadRobloxInstallerCancelled
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer & timeout /t 2 /nobreak>nul
goto StartRobloxInstaller 



:DownloadRobloxInstallerBackup
cls
echo.
echo Downloading Roblox Installer...
cd "%localappdata%\temp\ROTWETemp"
powershell -command Invoke-WebRequest -URI "https://www.roblox.com/download/client" -OutFile RobloxPlayerInstaller.exe > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo An Error Occured When Downloading The Installer, The Action Has Been Stopped
    echo.
    echo If This Error Still Persist, Please Report This By Messaging Me On Discord: _hzp
    timeout /t 2 /nobreak>nul
    echo.
    echo [ Press Any Key To Continue ]
    pause>nul
    goto Menu
)

goto DeleteRobloxFolderForReinstallation





:ReinstallationComplete

for /f "delims=" %%i in ('dir /s /b "%localappdata%\temp\ROTWETemp\RobloxPlayerBeta.exe"') do (
    rmdir /q /s "%%~dpi" > NUL 2>&1
)

cls
echo.
echo Reinstallation Complete.
timeout /t 2 /nobreak>nul
goto menu






:OptimizeRobloxMenu
cls
echo.
echo Page: Optimizer Menu
echo -------------------------------------
echo [ SC ] Set Config (Important Before Optimization)
echo.
echo [ O ] Optimize Roblox
echo.
echo [ B ] Go Back
echo -------------------------------------


set /p c=Enter Your Input: 
if /I "%C%" EQU "SC" goto CheckConfigs
if /I "%C%" EQU "O" goto CFCBeforeOptimization
if /I "%C%" EQU "B" goto  menu
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto OptimizeRobloxMenu



:CFCBeforeOptimization

set "Configtxtfile=C:\Program Files\ROTWEOptimizer\Config.cfg"

set "texturestatus=DISABLED"
set "shadersstatus=DISABLED"
set "UIStatus=DISABLED"
set "skyStatus=DISABLED"
set "terrainStatus=DISABLED"
set "CSStatus=DISABLED"
set "CursRepl=DISABLED"
set "FRO=DISABLED"

set "count_0=0"
set "count_1=0"

for /F "delims=" %%i in ('type "%Configtxtfile%"') do (
    if "%%i"=="textures = 0" (
        set /a count_0+=1
    ) else if "%%i"=="textures = 1" (
        set /a count_1+=1
        set "texturestatus=ENABLED"
    ) else if "%%i"=="shaders = 0" (
        set /a count_0+=1
    ) else if "%%i"=="shaders = 1" (
        set /a count_1+=1
        set "shadersstatus=ENABLED"
    ) else if "%%i"=="UI = 0" (
        set /a count_0+=1
    ) else if "%%i"=="UI = 1" (
        set /a count_1+=1
        set "UIStatus=ENABLED"
    ) else if "%%i"=="sky = 0" (
        set /a count_0+=1
    ) else if "%%i"=="sky = 1" (
        set /a count_1+=1
        set "skyStatus=ENABLED"
    ) else if "%%i"=="terrain = 0" (
        set /a count_0+=1
    ) else if "%%i"=="terrain = 1" (
        set /a count_1+=1
        set "terrainStatus=ENABLED"
    ) else if "%%i"=="clientsettings = 0" (
        set /a count_0+=1
    ) else if "%%i"=="clientsettings = 1" (
        set /a count_1+=1
        set "CSStatus=ENABLED"
    ) else if "%%i"=="cursorreplacement = 0" (
        set /a count_0+=1
    ) else if "%%i"=="cursorreplacement = 1" (
        set /a count_1+=1
        set "CursRepl=ENABLED"
    ) else if "%%i"=="fullscreenoptimization = 0" (
        set /a count_0+=1
    ) else if "%%i"=="fullscreenoptimization = 1" (
        set /a count_1+=1
        set "FRO=ENABLED"
    )
)

if %count_0%==8 (
    echo All values are ENABLED
    goto OptimizeRobloxDefaultAlert
) else if %count_1%==8 (
    echo All values are DISABLED
    goto AllConfigIsDisabled
) else (
    echo Some values are ENABLED and some are DISABLED
    goto OptimizeRobloxWFC
)




:AllConfigIsDisabled
cls
echo.
echo ROTWEOptimizer ROTWEOptimizer has detected that all configurations are disabled. As a result, ROTWEOptimizer Can't Optimize Roblox 
echo Because It Doesn't Know What To Do.
echo.
echo You may not be satisfied with the optimization results. Please ensure that you have enabled or disabled the necessary configurations based 
echo on your requirements.
echo.
echo The Action Has Been Stopped
timeout /t 2 /nobreak>nul
echo.
echo [ Press Any Key To Continue ]
pause>nul
goto menu




:OptimizeRobloxDefaultAlert
cls
echo.
echo ROTWEOptimizer has detected that all configurations are enabled. As a result, ROTWEOptimizer will optimize the Roblox that comes with the
echo configurations.
echo.
echo You may not be satisfied with the optimization results. Please ensure that you have enabled or disabled the necessary configurations based 
echo on your requirements.
echo.
echo If you purposely set all the configurations to enabled, You may like to continue.
echo ------------------------------------------------------------
echo [ C ] Continue 
echo.
echo [ X ] Go Back
echo.
echo [ G ] Go To Configurations Settings
echo.
echo.

set /p c=Enter Your Input: 
if /I "%C%" EQU "C" goto OptimizeRobloxDefault
if /I "%C%" EQU "X" goto OptimizeRobloxMenu
if /I "%C%" EQU "G" goto CheckConfigs

echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto OptimizeRobloxDefaultAlert





:OptimizeRobloxDefault
cls
echo.
echo Optimizing...


    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%%~dpiRobloxPlayerBeta.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f > NUL 2>&1
    cd /d "%%~dpi"
)



Rem Clean Up Textures
rmdir /q /s "PlatformContent\pc\textures\brick" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\cobblestone" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\concrete" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\corrodedmetal" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\diamondplate" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\fabric" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\foil" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\glass" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\granite" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\grass" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\ice" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\marble" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\metal" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\pebble" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\plastic" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\sand" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\slate" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\water" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\wood" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\woodplanks" > NUL 2>&1

del /q /s  "PlatformContent\pc\textures\brdfLUT.dds" > NUL 2>&1
del /q /s  "PlatformContent\pc\textures\studs.dds" > NUL 2>&1
del /q /s  "PlatformContent\pc\textures\wangIndex.dds" > NUL 2>&1

del /q /s /f "PlatformContent\pc\textures\sky\indoor512_bk.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_dn.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_ft.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_lf.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_rt.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_up.tex" > NUL 2>&1



del /q /s /f "PlatformContent\pc\terrain\diffuse.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\diffusearray.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\materials2022.json" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\normal.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\normalarray.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\reflection.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\reflectionarray.dds" > NUL 2>&1


rmdir /q /s "ExtraContent\textures\sky" > NUL 2>&1
rmdir /q /s "content\sky" > NUL 2>&1





del /q /s /f "shaders\keepme" > NUL 2>&1
del /q /s /f "shaders\shaders_d3d10.pack" > NUL 2>&1
del /q /s /f "shaders\shaders_d3d10_1.pack" > NUL 2>&1
del /q /s /f "shaders\shaders_glsl.pack" > NUL 2>&1
del /q /s /f "shaders\shaders_vulkan_desktop.pack" > NUL 2>&1







rmdir /q /s "content\textures\ui\Settings\MenuBarAssets" > NUL 2>&1
rmdir /q /s "content\textures\ui\Settings\MenuBarIcons" > NUL 2>&1


del /q /s /f "content\textures\Cursors\KeyboardMouse\ArrowCursor.png" > NUL 2>&1
del /q /s /f "content\textures\Cursors\KeyboardMouse\ArrowFarCursor.png" > NUL 2>&1

xcopy /y "content\textures\ArrowCursor.png" "%temp%" > NUL 2>&1
xcopy /y "content\textures\ArrowCursorDecalDrag.png" "%temp%" > NUL 2>&1
xcopy /y "content\textures\ArrowFarCursor.png" "%temp%" > NUL 2>&1




del /q /f "content\textures\*.png" > NUL 2>&1


move /y "%temp%\ArrowCursor.png" "content\textures\Cursors\KeyboardMouse"
move /y "%temp%\ArrowCursorDecalDrag.png" "content\textures\Cursors\KeyboardMouse"
move /y "%temp%\ArrowFarCursor.png" "content\textures\Cursors\KeyboardMouse"
goto ClientSettingsSection














:OptimizeRobloxWFC
cls
echo.
echo Optimizing...


    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    cd /d "%%~dpi"
)





set "Configtxtfile=C:\Program Files\ROTWEOptimizer\Config.cfg"


for /F "delims=" %%i in ('type "%Configtxtfile%"') do (
    if "%%i"=="textures = 0" (

Rem Clean Up Textures
del /q /f "content\textures\*.png" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\brick" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\cobblestone" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\concrete" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\corrodedmetal" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\diamondplate" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\fabric" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\foil" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\glass" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\granite" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\grass" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\ice" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\marble" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\metal" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\pebble" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\plastic" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\sand" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\slate" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\water" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\wood" > NUL 2>&1
rmdir /q /s "PlatformContent\pc\textures\woodplanks" > NUL 2>&1

del /q /s  "PlatformContent\pc\textures\brdfLUT.dds" > NUL 2>&1
del /q /s  "PlatformContent\pc\textures\studs.dds" > NUL 2>&1
del /q /s  "PlatformContent\pc\textures\wangIndex.dds" > NUL 2>&1

    ) else if "%%i"=="textures = 1" (
        rem Do Nothing
    ) else if "%%i"=="shaders = 0" (

del /q /s /f "PlatformContent\pc\textures\sky\indoor512_bk.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_dn.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_ft.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_lf.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_rt.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_up.tex" > NUL 2>&1

    ) else if "%%i"=="shaders = 1" (
        rem Do Nothing
    ) else if "%%i"=="UI = 0" (

rmdir /q /s "content\textures\ui\Settings\MenuBarAssets" > NUL 2>&1
rmdir /q /s "content\textures\ui\Settings\MenuBarIcons" > NUL 2>&1

    ) else if "%%i"=="UI = 1" (
        rem Do Nothing
    ) else if "%%i"=="sky = 0" (

del /q /s /f "PlatformContent\pc\textures\sky\indoor512_bk.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_dn.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_ft.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_lf.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_rt.tex" > NUL 2>&1
del /q /s /f "PlatformContent\pc\textures\sky\indoor512_up.tex" > NUL 2>&1
rmdir /q /s "ExtraContent\textures\sky" > NUL 2>&1
rmdir /q /s "content\sky" > NUL 2>&1

    ) else if "%%i"=="sky = 1" (
        rem Do Nothing
    ) else if "%%i"=="terrain = 0" (

del /q /s /f "PlatformContent\pc\terrain\diffuse.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\diffusearray.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\materials2022.json" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\normal.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\normalarray.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\reflection.dds" > NUL 2>&1
del /q /s /f "PlatformContent\pc\terrain\reflectionarray.dds" > NUL 2>&1

    ) else if "%%i"=="terrain = 1" (
        rem Do Nothing
    ) else if "%%i"=="cursorreplacement = 0" (

del /q /s /f "content\textures\Cursors\KeyboardMouse\ArrowCursor.png" > NUL 2>&1
del /q /s /f "content\textures\Cursors\KeyboardMouse\ArrowFarCursor.png" > NUL 2>&1

xcopy /y "content\textures\ArrowCursor.png" "%temp%" > NUL 2>&1
xcopy /y "content\textures\ArrowCursorDecalDrag.png" "%temp%" > NUL 2>&1
xcopy /y "content\textures\ArrowFarCursor.png" "%temp%" > NUL 2>&1




move /y "%temp%\ArrowCursor.png" "content\textures\Cursors\KeyboardMouse"
move /y "%temp%\ArrowCursorDecalDrag.png" "content\textures\Cursors\KeyboardMouse"
move /y "%temp%\ArrowFarCursor.png" "content\textures\Cursors\KeyboardMouse"

    ) else if "%%i"=="cursorreplacement = 1" (
        rem Do Nothing
    ) else if "%%i"=="fullscreenoptimization = 0" (

echo Hello World!
pause

for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    if exist "%%i" (
        REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%%~diRobloxPlayerBeta.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f > NUL 2>&1
        cd /d "%%~di"
    ) else (
        rem Do Nothing
    )
)

    ) else if "%%i"=="fullscreenoptimization = 1" (
        rem Do Nothing
    ) else if "%%i"=="clientsettings = 0" (
        goto ClientSettingsSection
    ) else if "%%i"=="clientsettings = 1" (
        rem Do Nothing
    )
)









:OptimizationComplete
cls
echo.
echo Optimization Complete.
timeout /t 3 /nobreak>nul
goto OptimizeRobloxMenu








:ClientSettingsSection

rem ClientSettings
cls
echo.
echo ClientSettings File. Please Choose One Blow.
echo.
echo     [ A ] No Texture    [ E ] Texture On    [ V ] Texture On + Increased FPS    [ O ] No Texture + Increased FPS    [ X ] Skip
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "A" goto NoTextureClientSettings
if /I "%C%" EQU "E" goto TextureOnClientSettings
if /I "%C%" EQU "V" goto TextureOnIncreasedFPS
if /I "%C%" EQU "O" goto NoTexutreIncreaseFPS
if /I "%C%" EQU "X" goto OptimizeRobloxMenu

echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul

goto ClientSettingsSection




:NoTexutreIncreaseFPS
cls
echo.
echo Adding ClientSettings...
timeout /t 2 /nobreak>Nul
echo.
rmdir /q /s "ClientSettings" > NUL 2>&1
mkdir ClientSettings > NUL 2>&1

powershell -command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GGHZp/Roblox-Alt-Enter-Files/main/ClientAppSettings4.json" -OutFile ClientSettings\ClientAppSettings.json
goto OptimizeRobloxMenu




:TextureOnIncreasedFPS
cls
echo.
echo Adding ClientSettings...
timeout /t 2 /nobreak>Nul
echo.
rmdir /q /s "ClientSettings" > NUL 2>&1
mkdir ClientSettings > NUL 2>&1

powershell -command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GGHZp/Roblox-Alt-Enter-Files/main/ClientAppSettings3.json" -OutFile ClientSettings\ClientAppSettings.json
goto OptimizeRobloxMenu





:TextureOnClientSettings
cls
echo.
echo Adding ClientSettings...
timeout /t 2 /nobreak>Nul
echo.
rmdir /q /s "ClientSettings" > NUL 2>&1
mkdir ClientSettings > NUL 2>&1

powershell -command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GGHZp/Roblox-Alt-Enter-Files/main/ClientAppSettings2.json" -OutFile ClientSettings\ClientAppSettings.json
goto OptimizeRobloxMenu




:NoTextureClientSettings
cls
echo.
echo Adding ClientSettings...
timeout /t 2 /nobreak>Nul
echo.
rmdir /q /s "ClientSettings" > NUL 2>&1
mkdir ClientSettings > NUL 2>&1

powershell -command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/GGHZp/Roblox-Alt-Enter-Files/main/ClientAppSettings.json" -OutFile ClientSettings\ClientAppSettings.json
goto OptimizeRobloxMenu










:RobloxIsNotInstalled
cls
echo.
echo An Error Occured.
echo -------------------------------------
echo Seems Like You Do Not Have Roblox Installed In Your System.
echo.
echo This Action Cannot Be Continue If You Do Not Have Roblox Installed In Your System.
echo.
echo If You Believe This Is a Mistake. Please DM Me At Discord To Report This Problem. Discord User: _hzp
echo -------------------------------------
timeout /t 2 /nobreak>nul
echo Press Any Key To Go Back
pause>nul
goto menu

:SettingsPage
cls
echo.
echo Page: Settings
echo ------------------------------------
echo Options:
echo.
echo [ C ] Check For Update
echo.
echo [ R ] Repair This Program
echo.
echo [ X ] Go Back
echo -----------------------------------


echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "C" goto ManualCheckForUpdate
if /I "%C%" EQU "R" goto RepairROTWEOptimizerPrepare
if /I "%C%" EQU "X" goto menu
goto SettingsPage





:RepairROTWEOptimizerPrepare
cls
echo.
echo Preparing...
del /q /s /f "%localappdata%\temp" > NUL 2>&1
rmdir /q /s "%localappdata%\temp\ROTWETemp" > NUL 2>&1
timeout /t 2/nobreak>nul
mkdir "%localappdata%\temp\ROTWETemp"
cd "%localappdata%\temp\ROTWETemp"
cls
echo.
echo Downloading Installer...
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/ROTWEOptPack/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe
timeout /t 2 /nobreak>nul
echo Closing Current App And Starting Installer...
start RobloxOptimizerInstaller.exe
exit /b 0




:ManualCheckForUpdate
cls
echo.
echo Checking For Requirements...
timeout /t 2 /nobreak>nul
cd "C:\Program Files\ROTWEOptimizer"

if exist "Version.txt" (
    if exist "Helper.exe" (
        goto ManualPreparationForUpdates
    )

cls
echo.
echo A File Is Not Found, The Process Has Been Stopped.
echo --------------------------------------------------
echo ERROR: File Not Found
echo FILE: Helper.exe
echo Tips: Go To Settings And Choose "R" To Repair This Program
echo --------------------------------------------------
echo          [ Press Any Key To Go Back ]
pause>nul
goto Menu

)

cls
echo.
echo A File Is Not Found, The Process Has Been Stopped.
echo --------------------------------------------------
echo ERROR: File Not Found
echo FILE: Version.txt
echo Tips: Go To Settings And Choose "R" To Repair This Program
echo --------------------------------------------------
echo          [ Press Any Key To Go Back ]
pause>nul
goto Menu





rem Update System:
:ManualPreparationForUpdates
cls
echo.
echo Preparing...
timeout /t 1 /nobreak>nul
del /q /s /f "%localappdata%\temp" > NUL 2>&1
rmdir /q /s "%localappdata%\temp\ROTWETemp" > NUL 2>&1
timeout /t 1 /nobreak>nul
mkdir "%localappdata%\temp\ROTWETemp" > NUL 2>&1

:UpdateFolderCheckLoop

cd "%localappdata%\temp"

@echo off
set "rotemp=%localappdata%\temp\ROTWETemp"
set "updateFile=%rotemp%\ROTWUpdateVer.txt"
set "versionFile=C:\Program Files\ROTWEOptimizer\Version.txt"

:: Check if "ROTWETemp" exists, and create it if not
if not exist "%rotemp%" (
    mkdir "%rotemp%"
)

:: Download update script
cd "%rotemp%"
powershell -command Invoke-WebRequest -URI "https://raw.githubusercontent.com/GGHZp/RblxOptimizer/main/UpdateI.bat" -OutFile "UpdateI.bat"

:: Wait for a short time
timeout /t 1 /nobreak > nul

:: Execute update script
cd "C:\Program Files\ROTWEOptimizer"
Helper exec hide "%rotemp%\UpdateI.bat"

:: Wait for another short time
timeout /t 1 /nobreak > nul

:: Clear screen
cls
echo.
echo Checking For Updates...
timeout /t 3 /nobreak > nul

:: Read version information
set /p version=<"%versionFile%"
set /p update=<"%updateFile%"

:: Compare version numbers
if %update% gtr %version% (
    goto :ManualUpdatesAreAvailable
) else if %update% lss %version% (
    goto :ManualUpdatesAreAvailable
) else (
    goto :ManualUpdatesNotAvailable
)









:ManualUpdatesNotAvailable
echo.
echo No Updates Are Available.
timeout /t 3 /nobreak>nul
echo.
echo [ Press Any Key To Go Back ]
pause > NUL 2>&1
goto SettingsPage



:ManualUpdatesAreAvailable
cls
echo.
echo Update Are Available.
echo -------------------------------
echo Current Version: & type "C:\Program Files\ROTWEOptimizer\Version.txt"
echo.
echo.
echo New Version: & type "%localappdata%\temp\ROTWETemp\ROTWUpdateVer.txt"
echo -------------------------------
echo Download The Update? (Y/N)
echo.

set /p c=Enter Your Input: 
if /I "%C%" EQU "Y" goto ManualDownloadUpdate
if /I "%C%" EQU "N" goto ManualCancel
goto ManualUpdatesAreAvailable

:ManualCancel
cls
echo.
echo Are You Sure To Cancel The Process? (Y/N)
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "Y" goto SettingsPage
if /I "%C%" EQU "N" goto ManualUpdatesAreAvailable
goto ManualCancel


:ManualDownloadUpdate
cls
echo.
echo Preparing...
cd "%localappdata%\temp\ROTWETemp"
timeout /t 2 /nobreak>nul


cls
echo.
echo Downloading Latest Installer...
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/ROTWEOptPack/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe
timeout /t 2 /nobreak>nul
cls
echo.




echo Closing Current App And Starting Installer...
timeout /t 2 /nobreak>nul
cd "%localappdata%\temp\ROTWETemp"
start RobloxOptimizerInstaller.exe
exit /b 0





:CheckConfigs
set "Configtxtfile=C:\Program Files\ROTWEOptimizer\Config.cfg"


for /F "delims=" %%i in ('type "%Configtxtfile%"') do (
    if "%%i"=="textures = 0" (
        set texturestatus=ENABLED
    ) else if "%%i"=="textures = 1" (
        set texturestatus=DISABLED
    ) else if "%%i"=="shaders = 0" (
        set shadersstatus=ENABLED
    ) else if "%%i"=="shaders = 1" (
        set shadersstatus=DISABLED
    ) else if "%%i"=="UI = 0" (
        set UIStatus=ENABLED
    ) else if "%%i"=="UI = 1" (
        set UIStatus=DISABLED
    ) else if "%%i"=="sky = 0" (
        set skyStatus=ENABLED
    ) else if "%%i"=="sky = 1" (
        set skyStatus=DISABLED
    ) else if "%%i"=="terrain = 0" (
        set terrainStatus=ENABLED
    ) else if "%%i"=="terrain = 1" (
        set terrainStatus=DISABLED
    ) else if "%%i"=="clientsettings = 0" (
        set CSStatus=ENABLED
    ) else if "%%i"=="clientsettings = 1" (
        set CSStatus=DISABLED
    ) else if "%%i"=="cursorreplacement = 0" (
        set CursRepl=ENABLED
    ) else if "%%i"=="cursorreplacement = 1" (
        set CursRepl=DISABLED
    ) else if "%%i"=="fullscreenoptimization = 0" (
        set FRO=ENABLED
    ) else if "%%i"=="fullscreenoptimization = 1" (
        set FRO=DISABLED
    )
)

goto RobloxOptConfig





:RobloxOptConfig
cls
echo.
echo Please ensure that you enable or disable the necessary configs as per your requirements.
echo.
echo Keep in mind that only the 'Enabled' status will be optimized by ROTWEOptimizer,  while the 'Disabled' status will not be optimized.
echo.
echo To Disable/Enable A Config, Please Enter Following Command: set [OPTION NUMBER] Config=DISABLE/ENABLE
echo.
echo For More Information Please Enter The Command "H" For Help, To See Option Info Please Enter: Info.[Options Number]
echo.
echo (Case-Insenstive)
echo -------------------------------------
echo [ 1 ] Shaders Config Status: %shadersstatus%
echo.
echo [ 2 ] Textures Config Status: %texturestatus%
echo.
echo [ 3 ] UI Config Status: %UIStatus%
echo.
echo [ 4 ] Sky Config Status: %skyStatus%
echo.
echo [ 5 ] Terrain Config Status: %terrainStatus%
echo.
echo [ 6 ] ClientAppSettings Config Status: %CSStatus%
echo.
echo [ 7 ] Cursor Replacement Status: %CursRepl%
echo.
echo [ 8 ] Fullscreen Optimization: %FRO%
echo.
echo [ H ] Help
echo.
echo [ B ] Go Back
echo.
echo [ R ] Refresh Configs
echo.
echo -------------------------------------
set /p c=Enter Your Input: 
if /I "%C%" EQU "set [1] Config=ENABLE" goto eShaders
if /I "%C%" EQU "set [1] Config=DISABLE" goto dshaders
if /I "%C%" EQU "info.[1]" goto InfoShaders

if /I "%C%" EQU "set [2] Config=ENABLE" goto etextures
if /I "%C%" EQU "set [2] Config=DISABLE" goto dtextures
if /I "%C%" EQU "info.[2]" goto Infotextures

if /I "%C%" EQU "set [3] Config=ENABLE" goto eui
if /I "%C%" EQU "set [3] Config=DISABLE" goto dui
if /I "%C%" EQU "info.[3]" goto InfoUI

if /I "%C%" EQU "set [4] Config=ENABLE" goto esky
if /I "%C%" EQU "set [4] Config=DISABLE" goto dsky
if /I "%C%" EQU "info.[4]" goto infosky

if /I "%C%" EQU "set [5] Config=ENABLE" goto eterrain
if /I "%C%" EQU "set [5] Config=DISABLE" goto dterrain
if /I "%C%" EQU "info.[7]" goto infoterrain

if /I "%C%" EQU "set [6] Config=ENABLE" goto eclientappsettings
if /I "%C%" EQU "set [6] Config=DISABLE" goto dclientappsettings
if /I "%C%" EQU "info.[6]" goto infoClientAppSettings

if /I "%C%" EQU "set [7] Config=ENABLE" goto ecursorreplacement
if /I "%C%" EQU "set [7] Config=DISABLE" goto dcursorreplacement

if /I "%C%" EQU "set [8] Config=ENABLE" goto eFullscreenOptimization
if /I "%C%" EQU "set [8] Config=DISABLE" goto dFullscreenOptimization
if /I "%C%" EQU "info.[8]" goto infoFullscreenOptimization

rem All Configs Disable/Enable
if /I "%C%" EQU "set [1,2,3,4,5,6,7,8] Config=ENABLE" goto eallconfigs
if /I "%C%" EQU "set [1, 2, 3, 4, 5, 6 ,7 ,8] Config=ENABLE" goto eallconfigs
if /I "%C%" EQU "set [all] Config=ENABLE" goto eallconfigs
if /I "%C%" EQU "set [1,8] Config=ENABLE" goto eallconfigs
if /I "%C%" EQU "set [1 > 8] Config=ENABLE" goto eallconfigs

if /I "%C%" EQU "set [1,2,3,4,5,6,7,8] Config=DISABLE" goto dallconfigs
if /I "%C%" EQU "set [1, 2, 3, 4, 5, 6 ,7 ,8] Config=DISABLE" goto dallconfigs
if /I "%C%" EQU "set [all] Config=DISABLE" goto dallconfigs
if /I "%C%" EQU "set [1,8] Config=DISABLE" goto dallconfigs
if /I "%C%" EQU "set [1 > 8] Config=DISABLE" goto dallconfigs

if /I "%C%" EQU "H" goto ConfigHelp
if /I "%C%" EQU "B" goto OptimizeRobloxMenu
if /I "%C%" EQU "R" goto CheckConfigs

echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul

goto CheckConfigs  









rem Configs Updation
rem ------------------------------------------------------------

:eShaders
cls
echo.
echo Enabling The Configuration Shaders...
timeout /t 2 /nobreak>Nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=shaders = 1"
set "replace_text=shaders = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dshaders
cls
echo.
echo Disabling The Configuration Shaders...
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=shaders = 0"
set "replace_text=shaders = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs



:etextures
cls
echo.
echo Enabling The Configuration Textures...
timeout /t 2 /nobreak>Nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=textures = 1"
set "replace_text=textures = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dtextures
cls
echo.
echo  Disabling The Configuration Textures...

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=textures = 0"
set "replace_text=textures = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:eui
cls
echo.
echo Enabling The Configuration UI...

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=UI = 1"
set "replace_text=UI = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dui
cls
echo.
echo  Disabling The Configuration UI...

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=UI = 0"
set "replace_text=UI = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs



:esky
cls
echo.
echo Enabling The Configuration Sky...
timeout /t 2 /nobreak>nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=sky = 1"
set "replace_text=sky = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dsky
cls
echo.
echo Disabling The Configuration Sky...
timeout /t 2 /nobreak>nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=sky = 0"
set "replace_text=sky = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:eterrain
cls
echo.
echo Enabling The Configuration Terrain...
timeout /t 2 /nobreak>nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=terrain = 1"
set "replace_text=terrain = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dterrain
cls
echo.
echo Disabling The Configuration Terrain...
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=terrain = 0"
set "replace_text=terrain = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:eclientappsettings
cls
echo.
echo Enabling The Configuration ClientAppSettings...
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=clientappsettings = 1"
set "replace_text=clientappsettings = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs



:dclientappsettings
cls
echo.
echo Disabling The Configuration ClientAppSettings...
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=clientappsettings = 0"
set "replace_text=clientappsettings = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:ecursorreplacement
cls
echo.
echo Enabling The Configuration CursorReplacement
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=cursorreplacement = 1"
set "replace_text=cursorreplacement = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs



:dcursorreplacement
cls
echo.
echo Disabling The Configuration CursorReplacement
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=cursorreplacement = 0"
set "replace_text=cursorreplacement = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:eFullscreenOptimization
cls
echo.
echo Enabling The Configuration FullscreenOptimization...
timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=fullscreenoptimization = 1"
set "replace_text=fullscreenoptimization = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs


:dFullscreenOptimization
cls
echo.
echo Disabling The Configuration FullscreenOptimization...

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=fullscreenoptimization = 0"
set "replace_text=fullscreenoptimization = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         
echo The Configuration Has Been successfully Updated.
timeout /t 3 /nobreak>nul
goto CheckConfigs




rem Configs Updation
rem ------------------------------------------------------------



rem ------------------------------------------------------------
rem All Configs Updation (ENABLE)



:eallconfigs
echo.
echo Enabling all configurations...

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=shaders = 1"
set "replace_text=shaders = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1        

timeout /t 1 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=textures = 1"
set "replace_text=textures = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         

timeout /t 1 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=UI = 1"
set "replace_text=UI = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1    

timeout /t 2 /nobreak>Nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=sky = 1"
set "replace_text=sky = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         

timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=terrain = 1"
set "replace_text=terrain = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1     

timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=clientsettings = 1"
set "replace_text=clientsettings = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         


timeout /t 2 /nobreak>nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=cursorreplacement = 1"
set "replace_text=cursorreplacement = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1       


timeout /t 2 /nobreak>Nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=fullscreenoptimization = 1"
set "replace_text=fullscreenoptimization = 0"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1     

echo.
echo ALl Configurations Has Been Updated.
timeout /t 2 /nobreak>nul
goto CheckConfigs


rem All Configs Updation (ENABLE)
rem ------------------------------------------------------------


rem ------------------------------------------------------------
rem All Configs Updation (DISABLE)


:dallconfigs
cls
echo.
echo Disabling All Configurations...
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=shaders = 0"
set "replace_text=shaders = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1        

timeout /t 1 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=textures = 0"
set "replace_text=textures = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         

timeout /t 1 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=UI = 0"
set "replace_text=UI = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1    

timeout /t 2 /nobreak>Nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=sky = 0"
set "replace_text=sky = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         

timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=terrain = 0"
set "replace_text=terrain = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1     

timeout /t 2 /nobreak>nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=clientsettings = 0"
set "replace_text=clientsettings = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1         


timeout /t 2 /nobreak>nul

set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=cursorreplacement = 0"
set "replace_text=cursorreplacement = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1       


timeout /t 2 /nobreak>Nul
set "file_path=C:\Program Files\ROTWEOptimizer\Config.cfg"
set "search_text=fullscreenoptimization = 0"
set "replace_text=fullscreenoptimization = 1"
if not exist "%file_path%" (
    goto ConfigReplacementError
)
set "temp_file=%temp%\tempfile.txt"
rem Loop through each line in the input file
(for /f "delims=" %%a in ('type "%file_path%"') do (
    set "line=%%a"
    if "!line:%search_text%=!" neq "!line!" (
        set "line=!replace_text!"
    )
    echo !line!
)) > "%temp_file%"
rem Replace the original file with the temporary file
move /y "%temp_file%" "%file_path%" > NUL 2>&1

echo.
echo ALl Configurations Has Been Updated.
timeout /t 2 /nobreak>nul
goto CheckConfigs


rem All Configs Updation (DISABLE)
rem ------------------------------------------------------------








rem ------------------------------------------------------------
rem Options Info

:infoFullscreenOptimization
cls
echo.
echo Information About Fullscreen Optimization
echo ----------------------------------------------
echo Enabling Fullscreen Optimization on Roblox App will improve your game's performance.
echo.
echo Please enable this if your ALT+ENTER Is not working, Disable this if the ALT+ENTER Is not working.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig



:cursor
cls
echo.
echo Information About Replacing Cursor
echo ----------------------------------------------
echo Replace the new Roblox cursor to the old cursor easily
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig



:infoClientAppSettings
cls
echo.
echo Information About Adding ClientAppSettings
echo ----------------------------------------------
echo Adding ClientAppSettings helpful to improve your game's Performance
echo.
echo You can add ALT+ENTER to Roblox to improve your game's performance
echo.
echo Some computer/laptop may need Fullscreen Optimization Enabled or Disabled to work
timeout /t 2 /nobreak>nul
echo.
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig




:infoterrain
cls
echo.
echo Information About Optimizing Game UI
echo ----------------------------------------------
echo Optimzing the game UI will not improve your game's Performance, But it will make the UI Transparent.
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig

:infosky
cls
echo.
echo Information About Optimizing Game UI
echo ----------------------------------------------
echo No Information Available For This Configs.
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig


:InfoUI
cls
echo.
echo Information About Optimizing Game UI
echo ----------------------------------------------
echo Optimzing the game UI will not improve your game's Performance, But it will make the UI Transparent.
echo.
echo NOTE: this will only works with the old UI. 
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig



:InfoShaders
cls
echo.
echo Information About Optimizing Game Shaders
echo ----------------------------------------------
echo Optimizing the game shaders can significantly improve your game's Performance but the game graphics may look bad on some games.
echo.
echo Keep in mind that the boost may not work on some devices.
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig



:Infotextures
cls
echo.
echo Information About Optimizing Game Textures
echo ----------------------------------------------
echo Optimizing Roblox Textures may improve your game's Performance little bit.
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig










:ConfigReplacementError
cls
echo.
echo An Error Occured When Changing The Config, Please Try Repairing The File Or Check For Update At The Settings.
echo.
echo If The Error Still Persist Please Report This By DM Me At Discord, Discord User: _hzp 
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Continue ]
pause>nul
goto RobloxOptConfig
































:ConfigHelp
cls
echo.
echo To DISABLE or ENABLE configs, Please Enter The Following Command: Set.[Option Number]=ENABLE
echo.
echo For Example If You Want To Disable The Config Textures You Need To Enter The Command: set.[1]=DISABLE
echo.
echo Example Below:
echo -------------------------------------
echo [ 1 ] Shaders
echo.
echo [ 2 ] Textures  ^< ============================
echo.                                              =
echo [ 3 ] UI                                      =
echo.                                              =
echo [ 4 ] Sky                                     =
echo.                                              =
echo [ 5 ] Terrain                                 =
echo.                                              =
echo [ 6 ] ClientAppSettings                       =
echo.                                              =
echo [ H ] Help                                    =
echo -------------------------------------         =
echo Enter Your Input: set.[2]=DISABLE   ^< ========
echo.
echo              This Command ^^ 
echo                 Will Disable The Config "Textures" As The Second Option.
echo.
timeout /t 5 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig