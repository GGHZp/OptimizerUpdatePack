@echo off
rem App Information
rem Authorization: HZp, _h3p
rem App Name: Roblox_Optimizer, ROTWEOptimizer
rem App Location: C:\Program Files\ROTWEOptimizer\roblox_optimizer
rem Installed Directory: C:\Program Files\ROTWEOptimizer
rem Date: March-20-2024    --Please change the date everytime changes made to the script
rem Version: 1.2           --Please change the version everytime new release of the app

:setColor
set "Configtxtfile=C:\Program Files\ROTWEOptimizer\TextsColor"


for /F "delims=" %%i in ('type "%Configtxtfile%"') do (
    if "%%i"=="1" (
        color 1 & goto autoCheckForUpdate
    ) else if "%%i"=="2" (
        color 2 & goto autoCheckForUpdate
    ) else if "%%i"=="3" (
        color 3 & goto autoCheckForUpdate
    ) else if "%%i"=="4" (
        color 4 & goto autoCheckForUpdate
    ) else if "%%i"=="5" (
        color 5 & goto autoCheckForUpdate
    ) else if "%%i"=="6" (
        color 6 % goto autoCheckForUpdate
    ) else if "%%i"=="7" (
        color 7 % goto autoCheckForUpdate
    ) else if "%%i"=="8" (
        color 8 & goto autoCheckForUpdate
    ) else if "%%i"=="9" (
        color 9 & goto autoCheckForUpdate
    ) else if "%%i"=="A" (
        color a & goto autoCheckForUpdate
    ) else if "%%i"=="B" (
        color b & goto autoCheckForUpdate
    ) else if "%%i"=="C" (
        color c & goto autoCheckForUpdate
    )
)

color & goto autoCheckForUpdate
pause



:autoCheckForUpdate
title Hi %username% For Safety, Checking for updates And Preparing...
cls
echo.
echo Checking For Updates...

rem Preparing Phase

cd "%localappdata%\temp"
rmdir /q /s "ROTWETemp" > NUL 2>&1
mkdir "ROTWETemp" > NUL 2>&1

rem Checking for requirements

cd "C:\Program Files\ROTWEOptimizer"
if not exist "Version.txt" (
    cls
    echo.
    echo Requirement Missing: Version.txt
    echo --------------------------------
    echo Looks Like ROTWEOptimizer Is Not Installed Properly.
    echo Please Reinstall Or Repair This Program, If This Issue Still Persist Contact Me At Discord: _hzp
    echo The Process Has Been Stopped Due To Requirement Missing.
    echo --------------------------------
    echo [ Press Any Key To Continue ]
    pause>nul
    goto menu
)
if not exist "Helper.exe" (
    cls
    echo.
    echo Requirement Missing: Helper.exe
    echo --------------------------------
    echo Looks Like ROTWEOptimizer Is Not Installed Properly.
    echo Please Reinstall Or Repair This Program, If This Issue Still Persist Contact Me At Discord: _hzp
    echo The Process Has Been Stopped Due To Requirement Missing.
    echo --------------------------------
    echo [ Press Any Key To Continue ]
    pause>nul
    goto menu
)

cd "%localappdata%\temp\ROTWETemp"
rem Downloading Update Instruction (UpdateI) From Github
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/OptimizerUpdatePack/raw/main/UpdateI.exe" -OutFile "%localappdata%\temp\ROTWETemp\UpdateI.exe" > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo Something Went Wrong, Retrying...
    powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/OptimizerUpdatePack/raw/main/UpdateI.exe" -OutFile "%localappdata%\temp\ROTWETemp\UpdateI.exe" > NUL 2>&1
    if errorlevel 1 (
        cls
        echo.
        echo Something Went Wrong, Updates Checking Has Been Stopped Due To Requirement Missing.
        timeout /t 3 /nobreak>nul
        goto menu
    )
)
rem Downloading updates message to tell users if it critical updates or small updates

powershell -command Invoke-WebRequest -URI "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/updMsg.txt" -OutFile "%localappdata%\temp\ROTWETemp\updMsg.txt" > NUL 2>&1

if %errorlevel% equ 0 (
    set "updMsgSt=success"
    goto :chckUpdMsgSt
)
set "updMsgSt=failed"
goto :chckUpdMsgSt


:chckUpdMsgSt
if "%updMsgSt%"=="success" (
    set "updMsg=type %localappdata%\temp\ROTWETemp\updMsg.txt & echo."
    goto autoCheckForUpdate2
) else if "%updMsgSt%"=="failed" (
    set "updMsg=echo Unknown"
    goto autoCheckForUpdate2
)
set "updMsg=echo Unknown"
goto autoCheckForUpdate2




:autoCheckForUpdate2

cd "%localappdata%\temp\ROTWETemp"
start /wait UpdateI.exe > NUL 2>&1
timeout /t 2 /nobreak>nul

set "updateFile=%TEMP%\ROTWETemp\ROTWUpdateVer.txt"
set "versionFile=C:\Program Files\ROTWEOptimizer\Version.txt"
set /p update=<"%updateFile%"
set /p version=<"%versionFile%"
:: Compare version numbers
if %update% gtr %version% (
    goto :AutoUpdatesAreAvailable
) else if %update% lss %version% (
    goto :AutoUpdatesNotAvailable
) else (
    goto :AutoUpdatesNotAvailable
)


:AutoUpdatesNotAvailable
title No Updates Available
cls
echo.
echo No Updates Available.
timeout /t 3 /nobreak>nul
goto menu



:AutoUpdatesAreAvailable
title Updates Are Available!
cls
echo.
echo Update Are Available.
echo -------------------------------
echo Current Version: & type "C:\Program Files\ROTWEOptimizer\Version.txt"
echo.
echo.
echo New Version: & type "%localappdata%\temp\ROTWETemp\ROTWUpdateVer.txt"
echo.
echo Update Message: & call %updMsg%
echo -------------------------------
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Download The Updates ]
pause>nul

rem Downloading Installer
cd "%localappdata%\temp\ROTWETemp"
cls
echo.
echo Downloading Installer...
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/LoqQualityRobloxOptimizer/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo Failed Downloading Installer, Retrying...
    powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/LoqQualityRobloxOptimizer/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe > NUL 2>&1
    if errorlevel 1 (
        cls
        echo.
        echo Retry Failed.
        echo.
        echo The Process Has Been Stopped Due To Requirement Missing.
        echo.
        echo [ Press Any Key To Continue ]
        pause>Nul
        goto menu
    )
    rem Download Successfully
)
rem Download Successfully

cls
echo.
echo Starting Installer...
cd "%localappdata%\temp\ROTWETemp"
start RobloxOptimizerInstaller.exe > NUL 2>&1
timeout /t 2 /nobreak>nul
exit /b 0







:menu
title The Low Quality Roblox Optimizer By HZp
cls
setlocal enabledelayedexpansion
mode con:cols=140 lines=35
echo.
echo                         Welcome To Roblox Optimizer. In this tool you can optimize your roblox easier.
echo                        --------------------------------------------------------------------------------
echo.
echo                                                      [ O ] Optimizer Menu
echo.
echo                              [ F ] Roblox Folder   [ S ] Start Roblox App   [ R ] Reinstall Roblox
echo.
echo                               [ C ] Change ClientAppSettings   [ CI ] Check Roblox Reinstallation
echo.
echo                                                             OTHERS
echo                                                             ------
echo.
echo                                               [ ST ] Settings   [ L ] Updates Logs
echo.
echo.
echo.
echo                                                             Choices:
set /p c=^|                                                              
if /I "%C%" EQU "O" goto OptimizeRobloxMenu
if /I "%C%" EQU "R" echo. & echo The Choice "R" Is Currently Disabled Due To Maintenance & timeout /t 3 /nobreak>nul & goto menu
if /I "%C%" EQU "S" goto StartRoblox
if /I "%C%" EQU "F" goto OpenRobloxFolder
if /I "%C%" EQU "C" goto ClientSettingsSection
if /I "%C%" EQU "ST" goto SettingsPage
if /I "%C%" EQU "L" goto UpdateLogsMenu
if /I "%C%" EQU "CI" goto chckRblxInstMenu
if /I "%C%" EQU "D" goto delUnRobloxFilesMenu
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto menu


rem "R" for ReinstallRobloxMenuCheckForFolder Label


:chckRblxInstMenu
cls
echo.
echo Page: Roblox Installation Checker
echo.
echo Check For Roblox Folders And Files If All Of Them Is Exist.
echo.
echo We Have Over 3500+ List Of Directories To Check.
echo.
echo [ C ] Start Checking [ B ] Go Back (nvm lol)
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "C" goto chckRblxInstPrepare
if /I "%C%" EQU "B" goto menu
echo.
echo Invalid Choice.
timeout /t 1 /nobreak>nul
goto chckRblxInstMenu



:chckRblxInstPrepare
cls
echo.
echo Preparing...

    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
    rem Roblox is exist at current directory, Changing directory to current directory and then goto chckRblxInst
    cd /d "%%~dpi"
    goto chckRblxInst
)
    for /f "delims=" %%i in ('dir /s /b "%localappdata%\Roblox\RobloxPlayerBeta.exe"') do (
    rem Roblox is exist at current directory, Changing directory to current directory and then goto chckRblxInst
    cd /d "%%~dpi"
    goto chckRblxInst
)




:chckRblxInst
cls
echo.
echo Downloading Data...
cd "%localappdata%\temp"
if not exist "ROTWETemp" (
    mkdir "ROTWETemp"
    goto chckRblxInst
)
cd "%localappdata%\temp\ROTWETemp"
del /q /f "dirList.txt" > NUL 2>&1
powershell -command Invoke-WebRequest -URI "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/dirList.txt" -OutFile "dirList.txt"

cls
echo.
echo Scanning Roblox Installation...

:: Read the list of directories from a text file
for /f "delims=" %%a in (%localappdata%\temp\ROTWETemp\dirList.txt) do (
    set "dir=%%a"
    if not exist "!dir!" (
        rem One of them or more is not exist
        goto :bChckRblxInstUnc
    )
)

:: If all directories exist, go to label :a
rem All directories exist
goto :aChckRblxInstComp

:bChckRblxInstUnc
rem One or more directories do not exist
cls
echo.
echo Roblox Is Not Installed Properly, A Files/Folders Is Missing.
echo.
echo Missing: %dir%
echo.
echo [ Press Any Key To Go Back ]
pause>nul
goto menu

:aChckRblxInstComp
rem Do something if all directories exist
cls
echo.
echo Scanning Is Complete.
echo.
echo Roblox Is Installed Properly!
echo.
echo [ Press Any Key To Go Back ]
pause>Nul
goto menu








:UpdateLogsMenu
cls
echo.
echo Page: Update Logs
echo.
echo INFO: Online Mode May Have The Latest Logs, But Slower Depending On Connection Speed.
echo INFO: Offline Modes May Have Oudated Logs But Faster.
echo Please Use
echo.
echo [ OF ] Update Logs (Offline)  [ ON ] Update Logs (Online)  [ B ] Go Back
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "OF" goto UpdateLogsOffline
if /I "%C%" EQU "ON" goto UpdatesLogsOnline
if /I "%C%" EQU "B" goto menu
echo.
echo Invalid Choice.
timeout /t 1 /nobreak>nul
goto UpdateLogsMenu


:UpdateLogsOffline
echo.
cls
echo Version: & type "C:\Program Files\ROTWEOptimizer\Version.txt"
echo.
echo Date: March-3-2024
echo.
echo Updates Logs:
echo -------------------------------------
echo Fixed Known Errors.
echo.
echo Improved Some Codes.
echo.
echo Added New Features.
echo.
echo Added More Error Handling.
echo -------------------------------------
echo Wrong Version? Please Update The Program Again Or Repair
echo.
timeout /t 2 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto menu




:UpdatesLogsOnline

del /q /f "%localappdata%\temp\ROTWETemp\UpdLogs.txt" > NUL 2>&1 
del /q /f "%localappdata%\temp\ROTWETemp\Version.txt" > NUL 2>&1
del /q /f "%localappdata%\temp\ROTWETemp\UpdLogsDate.txt" > NUL 2>&1

cls
echo.
echo Downloading Information...
echo.
echo 1 Out Of 3
timeout /t 1 /nobreak>Nul
rem Download Version
cd "%localappdata%\temp"
if not exist "ROTWETemp" (
    mkdir "ROTWETemp" > NUL 2>&1
    goto UpdatesLogsOnline
) 
cd "%localappdata%\temp\ROTWEOptimizer"

powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/OptimizerUpdatePack/raw/main/Version.txt" -OutFile "%localappdata%\temp\ROTWETemp\Version.txt" > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo Failed Downloading Version, Retrying...
    powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/OptimizerUpdatePack/raw/main/Version.txt" -OutFile "%localappdata%\temp\ROTWETemp\Version.txt" > NUL 2>&1
    if errorlevel 1 (
        cls
        echo.
        echo Retry Failed.
        echo.
        echo This Process Has Been Stopped Due To Requirement Missing, Sorry.
        echo.
        echo You Can Always Check Update Logs Offline, It May Have Some Outdated Logs.
        echo.
        echo [ Press Any Key To Go Back ]
        pause>Nul
        goto menu
    )
    rem Version successfully downloaded
)

rem Version Successfully Downloaded
rem Download Date

cls
echo.
echo Downloading Information..
echo.
echo 2 Out Of 3

powershell -command Invoke-WebRequest -URI "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/UpdLogsDate.txt" -OutFile "%localappdata%\temp\ROTWETemp\UpdLogsDate.txt" > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo Failed Downloading Date, Retrying...
    powershell -command Invoke-WebRequest -URI "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/UpdLogsDate.txt" -OutFile "%localappdata%\temp\ROTWETemp\UpdLogsDate.txt" > NUL 2>&1
    if errorlevel 1 (
        cls
        echo.
        echo Retry Failed.
        echo.
        echo This Process Has Been Stopped Due To Requirement Missing, Sorry.
        echo.
        echo You Can Always Check Update Logs Offline, It May Have Some Outdated Logs.
        echo.
        echo [ Press Any Key To Go Back ]
        pause>Nul
        goto menu
    )
    rem Downloaded Successfully
    set "getDate_UpdLogs=type "%localappdata%\temp\ROTWETemp\UpdLogsDate.txt""
)
rem Downloaded Successfully
set "getDate_UpdLogs=type "%localappdata%\temp\ROTWETemp\UpdLogsDate.txt""


rem Date successfully downloaded
rem Download Update Logs

cls
echo.
echo Downloading Information...
echo.
echo 3 Out Of 3
timeout /t 1 /nobreak>nul

powershell -command Invoke-WebRequest "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/UpdLogs.txt" -OutFile "%localappdata%\temp\ROTWETemp\UpdLogs.txt" > NUL 2>&1
if errorlevel 1 (
    cls
    echo.
    echo Failed Downloading Update Logs, Retrying...
    powershell -command Invoke-WebRequest "https://raw.githubusercontent.com/GGHZp/OptimizerUpdatePack/main/UpdLogs.txt -OutFile "%localappdata%\temp\ROTWETemp\UpdLogs.txt" > NUL 2>&1
    if errorlevel 1 (
        cls
        echo.
        echo Retry Failed.
        echo.
        echo This Process Has Been Stopped Due To Requirement Missing, Sorry.
        echo.
        echo You Can Always Check Update Logs Offline, It May Have Some Outdated Logs.
        echo.
        echo [ Press Any Key To Go Back ]
        pause>Nul
        goto menu
    )
    rem Downloaded Successfully
)
rem Downloaded Successfully

echo.
cls
echo Version: & type "%localappdata%\temp\ROTWETemp\Version.txt"
echo.
%getDate_UpdLogs%
echo.
echo Updates Logs:
echo -------------------------------------
type "%localappdata%\temp\ROTWETemp\UpdLogs.txt"
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
echo [ RE ] Restart ROTWEOptimizer
echo.
echo [ TC ] Theme Color
echo.
echo [ ADVC ] Command Line (For Advanced Users) [Coming Soon]
echo.
echo [ X ] Go Back
echo -----------------------------------


echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "C" goto ManualCheckForUpdate
if /I "%C%" EQU "R" goto RepairROTWEOptimizerPrepare
if /I "%C%" EQU "ADVC" goto commandLineADVC
if /I "%C%" EQU "X" goto menu
if /I "%C%" EQU "RE" goto autoCheckForUpdate
if /I "%C%" EQU "TC" goto themeColorCheck
goto SettingsPage

:themeColorCheck
set "Configtxtfile=C:\Program Files\ROTWEOptimizer\TextsColor.cfg"


for /F "delims=" %%i in ('type "%Configtxtfile%"') do (
    if "%%i"=="1" (
        color 1 & goto themeColorMenu
    ) else if "%%i"=="2" (
        color 2 & goto themeColorMenu
    ) else if "%%i"=="3" (
        color 3 & goto themeColorMenu
    ) else if "%%i"=="4" (
        color 4 & goto themeColorMenu
    ) else if "%%i"=="5" (
        color 5 & goto themeColorMenu
    ) else if "%%i"=="6" (
        color 6 % goto themeColorMenu
    ) else if "%%i"=="7" (
        color 7 % goto themeColorMenu
    ) else if "%%i"=="8" (
        color 8 & goto themeColorMenu
    ) else if "%%i"=="9" (
        color 9 & goto themeColorMenu
    ) else if "%%i"=="A" (
        color a & goto themeColorMenu
    ) else if "%%i"=="B" (
        color b & goto themeColorMenu
    ) else if "%%i"=="C" (
        color c & goto themeColorMenu
    )
)

color & goto themeColorMenu


:themeColorMenu

cls
echo.
echo Page: Color Theme
echo.
echo Here You Can Change This App Texts Color.
echo.
echo Colors Available:
echo.
echo [ 1 ] Blue         [ 7 ] White
echo.
echo [ 2 ] Dark Green   [ 8 ] Gray
echo.
echo [ 3 ] Aqua         [ 9 ] Light Blue
echo.
echo [ 4 ] Red          [ A ] Light Green
echo.
echo [ 5 ] Purple       [ B ] Light Aqya
echo.
echo [ 6 ] Yellow       [ C ] Light Red
echo.
echo.
echo.
set /p c=Enter Your Input: 
if /I "%C%" EQU "1" goto changeAppColor



:changeAppColor
cls
echo.
echo Changing Texts Color...
timeout /t 1 /nobreak>nul

cd "C:\Program Files\ROTWEOptimizer"

    if "%C%"=="1" (
        echo 1 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="2" (
        echo 2 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="3" (
        echo 3 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="4" (
        echo 4 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="5" (
        echo 5 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="6" (
        echo 6 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="7" (
        echo 7 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="8" (
        echo 8 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="9" (
        echo 9 > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="A" (
        echo A > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="B" (
        echo B > TextsColor.cfg
        goto themeColorCheck
    ) else if "%C%"=="C" (
        echo C > TextsColor.cfg
        goto themeColorCheck
    )
    echo.
    echo No Color Choice Entered.
    timeout /t 1 /nobreak>nul
    goto themeColorCheck








:commandLineADVC
cls
echo. 
echo Checking For Requirements...

if not exist "C:\Program Files\ROTWEOptimizer\TL.bat" (
    cls
    echo.
    echo Required File Is Not Installed, Do You Want To Install Them?
    echo.
    echo File Size: Less Than 10 MB
    echo.
    echo [ I ] Install [ C ] Cancel (Go Back)
    echo.
    set /p c=Enter Your Input: 
    if /I "%C%" EQU "I" goto instROTWECmdLine
    if /I "%C%" EQU "C" goto menu
    echo.
    echo Invalid Choice.
    timeout /t 1 /nobreak>nul
    goto commandLineADVC
)

:instROTWECmdLine
cls
echo.
echo Installing...





:RepairROTWEOptimizerPrepare
cls
echo.
echo Preparing...
timeout /t 2 /nobreak>nul
del /q /s /f "%localappdata%\temp" > NUL 2>&1
rmdir /q /s "%localappdata%\temp\ROTWETemp" > NUL 2>&1
timeout /t 2/nobreak>nul
mkdir "%localappdata%\temp\ROTWETemp"
cd "%localappdata%\temp\ROTWETemp"
cls
echo.
echo Downloading Installer...
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/LoqQualityRobloxOptimizer/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe



if errorlevel 1 (
    cls
    echo.
    echo Something Went Wrong When Downloading The Installer, It Could Be Incorrect URL Or Outdated URL, The Action Has Been Stopped
    timeout /t 2 /nobreak>nul
    echo.
    echo [ Press Any Key To Continue ]
    pause>nul
    goto menu
)

timeout /t 2 /nobreak>nul
echo.
echo Closing Current App And Starting Installer...
timeout /t 2 /nobreak>nul
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


:: Check if "ROTWETemp" exists, and create it if not
if not exist "%rotemp%" (
    mkdir "%rotemp%"
)

:: Download update script
cd "%rotemp%"
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/OptimizerUpdatePack/raw/main/UpdateI.exe" -OutFile "%rotemp%\UpdateI.exe"

:: Wait for a short time
timeout /t 1 /nobreak > nul

:: Execute update script
cd "%rotemp%"
start /wait UpdateI.exe > NUL 2>&1

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
set "updateFile=%rotemp%\ROTWUpdateVer.txt"
set "versionFile=C:\Program Files\ROTWEOptimizer\Version.txt"
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
powershell -command Invoke-WebRequest -URI "https://github.com/GGHZp/LoqQualityRobloxOptimizer/raw/main/RobloxOptimizerInstaller.exe" -OutFile RobloxOptimizerInstaller.exe
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
echo [ 1 ] Shaders Config State: %shadersstatus%
echo.
echo [ 2 ] Textures Config State: %texturestatus%
echo.
echo [ 3 ] UI Config State: %UIStatus%
echo.
echo [ 4 ] Sky Config State: %skyStatus%
echo.
echo [ 5 ] Terrain Config State: %terrainStatus%
echo.
echo [ 6 ] ClientAppSettings Config State: %CSStatus%
echo.
echo [ 7 ] Cursor Replacement State: %CursRepl%
echo.
echo [ 8 ] Fullscreen Optimization State: %FRO%
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
echo No Information Available For This Config.
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
echo                    To Disable All The Configs Please Enter "ALL" Inside The "[]"
echo                      Example: set [all] Config=enable 
echo.
timeout /t 5 /nobreak>nul
echo [ Press Any Key To Go Back ]
pause>nul
goto RobloxOptConfig








:ReinstallRobloxMenuCheckForFolder
rem Check If Backup Folder Is Exist Or Not
cls
echo.
echo Please Wait...
for /f "delims=" %%i in ('dir /s /b "%localappdata%\temp\ROTWEReins\RobloxPlayerBeta.exe"') do (
rem Backup Folder Is Found
goto ReinstallRobloxMenu2
)
rem Backup Folder Is Not Found
goto ReinstallRobloxMenu


rem Backup Folder Is Not Found
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
if /I "%C%" EQU "R" goto ReinstallRobloxPrepareSetFolder
if /I "%C%" EQU "B" goto Menu
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto ReinstallRobloxMenu





rem Backup Folder Is Found
:ReinstallRobloxMenu2
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
echo [ RS ] Restore Point
echo.
echo [ B ] Go Back
echo -------------------------------------
set /p c=Enter Your Input: 
if /I "%C%" EQU "R" goto ReinstallRobloxPrepareSetFolder
if /I "%C%" EQU "RS" goto RestoreBackupFolder
if /I "%C%" EQU "B" goto Menu
echo.
echo The Command "%C%" Is Not Recognized By ROTWEOptimizer. Please Enter A Proper Command.
timeout /t 1 /nobreak>nul
goto ReinstallRobloxMenu





:RestoreBackupFolderMenu
cls
echo.
echo Page: Reinstallation Restore Point
echo.
echo You Can Use this To Restore All Deleted Files/Folders When The Installer Is Not Running Properly.
echo -------------------------------------
echo [ R ] Restore
echo.
echo [ D ] Delete Restore Point
echo.
echo [ B ] Go Back
echo -------------------------------------
set /p c=Enter Your Input: 
if /I "%C%" EQU "R" goto RestoreBackupFolder
if /I "%C%" EQU "D" goto DeleteRestoreePoint
if /I "%C%" EQU "B" goto ReinstallRobloxMenuCheckForFolder
goto RestoreBackupFolderMenu




:ReinstallRobloxPrepareSetFolder
cls
echo.
echo Preparing...

rem error handling
if not exist "C:\Program Files\ROTWEOptimizer" (
    cls
    echo.
    echo Required Folder Is Not Exist, Please Repair This Program At Settings, Or Install This Program Manually.
    echo.
    echo [ Press Any Key To Go Back ]
    pause>nul
    goto menu
)
rem error handling 2
if exist "C:\Program Files\ROTWEOptimizer\Roblox_Backup" (
    :bckpFoldIsExist
    cls
    echo.
    echo Previous Backup Is Found, In Order To Continue This Process, Previously Backup Have To Deleted.
    echo.
    echo Do You Want To Delete The Backup? If You Choose [ N ] The Process Will Be Canceled.
    echo.
    echo [ Y ] Yes [ N ] No
    echo.
    set /p c=Enter Your Input: 
    if /I "%C%" EQU "Y" goto reinsContinuebckp
    if /I "%C%" EQU "N" goto reinsCancel
    echo.
    echo Invalid Choice.
    timeout /t 1 /nobreak>nul
    goto bckpFoldIsExist
)
:reinsContinuebckp
cls
echo.
echo Preparing...
    
    rmdir /q /s "%temp%\ROTWETemp" 
    cd "%temp%"
    mkdir "ROTWETemp" > NUL 2>&1


    rmdir /q /s "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
    timeout /t 1 /nobreak>nul
    cd "C:\Program Files\ROTWEOptimizer" & mkdir "Roblox_Backup" > NUL 2>&1

    rem Check for RobloxPlayerBeta.exe in the Roblox folder
    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
        rem RobloxPlayerBeta.exe is found, Backing up Roblox files/folders
        move /y /s "%%~dpi" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y /s "C:\ProgramData" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y /s "%localappdata%\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y "%userprofile%\Desktop\Roblox Player" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1

        reg export "HKEY_CURRENT_USER\SOFTWARE\ROBLOX Corporation" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\ROBLOX Corporation (HCU)" > NUL 2>&1
        reg export "HKEY_CURRENT_USER\SOFTWARE\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\Roblox (HCU)" > NUL 2>&1
    
        reg export "HKEY_LOCAL_MACHINE\SOFTWARE\ROBLOX Corporation" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\ROBLOX Corporation (HLM)" > NUL 2>&1
        reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\Roblox (HLM)" > NUL 2>&1
        goto downloadRoblox
    )
    rem If Roblox is not found at current directory then search at the following directory
        for /f "delims=" %%j in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (

        rem RobloxPlayerBeta.exe is found, Backing up Roblox files/folders
        move /y /s "%%~dpj" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y /s "C:\ProgramData" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y /s "%localappdata%\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1
        move /y "%userprofile%\Desktop\Roblox Player" "C:\Program Files\ROTWEOptimizer\Roblox_Backup" > NUL 2>&1

        reg export "HKEY_CURRENT_USER\SOFTWARE\ROBLOX Corporation" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\ROBLOX Corporation (HCU)" > NUL 2>&1
        reg export "HKEY_CURRENT_USER\SOFTWARE\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\Roblox (HCU)" > NUL 2>&1
    
        reg export "HKEY_LOCAL_MACHINE\SOFTWARE\ROBLOX Corporation" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\ROBLOX Corporation (HLM)" > NUL 2>&1
        reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" "C:\Program Files\ROTWEOptimizer\Roblox_Backup\Roblox (HLM)" > NUL 2>&1
        goto downloadRoblox

    )
    rem Not found at current directory, Could be it got deleted
    goto downloadRoblox




    :downloadRoblox
    cls
    echo.
    echo Downloading Roblox Installer...
    rem error handling
    if not exist "%temp%\ROTWETemp" (
        cd %temp%
        mkdir "ROTWETemp" > NUL 2>&1
        goto downloadRoblox
    )
    rem Downloading Roblox from it's official website
    powershell -command Invoke-WebRequest -URI "https://www.roblox.com/download/client" -OutFile "%temp%\ROTWETemp\RobloxPlayerInstaller.exe"
    pause
    if errorlevel 1 (
    rem Download failed
        cls
        echo.
        echo Download Failed, Retrying...
        powershell -command Invoke-WebRequest -URI "https://www.roblox.com/download/client" -OutFile "%temp%\ROTWETemp\RobloxPlayerInstaller.exe"
        pause
        if errorlevel 1 (
            cls
            echo.
            echo Download Failed, Reinstallation Process Has Been Stopped, Please Try Again Later
            echo.
            echo Temp, Backup Folder Has Been Cleared.
            echo.
            echo [ Press Any Key To Continue ]
            pause>nul
            goto menu
        )
        rem Retrying successfully
        goto downloadRobloxSuccess
    )
    :downloadRobloxSuccess
    rem Download successfully, Rem deleting Roblox
    cls
    echo.
    echo Uninstalling Roblox...
    
        rem Check for RobloxPlayerBeta.exe in the Roblox folder
    for /f "delims=" %%i in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (
        rem RobloxPlayerBeta.exe is found, Backing up Roblox files/folders
        del /q /s /f "%%~dpi" > NUL 2>&1
        del /q /s /f "C:\ProgramData" > NUL 2>&1
        del /q /s /f "%localappdata%\Roblox" > NUL 2>&1
        del /q /s /f "%userprofile%\Desktop\Roblox Player" > NUL 2>&1

        reg delete "HKEY_CURRENT_USER\SOFTWARE\ROBLOX Corporation" > NUL 2>&1
        reg delete "HKEY_CURRENT_USER\SOFTWARE\Roblox" > NUL 2>&1
    
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\ROBLOX Corporation" > NUL 2>&1
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" > NUL 2>&1
        goto startInstaller
    )
    rem If Roblox is not found at current directory then search at the following directory
        for /f "delims=" %%j in ('dir /s /b "C:\Program Files (x86)\Roblox\RobloxPlayerBeta.exe"') do (

        rem RobloxPlayerBeta.exe is found, Backing up Roblox files/folders
        del /q /s /f "%%~dpj" > NUL 2>&1
        del /q /s /f "C:\ProgramData" > NUL 2>&1
        del /q /s /f "%localappdata%\Roblox" > NUL 2>&1
        del /q /s /f "%userprofile%\Desktop\Roblox Player" > NUL 2>&1

        reg delete "HKEY_CURRENT_USER\SOFTWARE\ROBLOX Corporation" > NUL 2>&1
        reg delete "HKEY_CURRENT_USER\SOFTWARE\Roblox" > NUL 2>&1
    
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\ROBLOX Corporation" > NUL 2>&1
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" > NUL 2>&1
        goto startInstaller

    )
    rem Not found at current directory, Could be it got deleted
    goto startInstaller



    :startInstaller
    rem Installing Roblox by starting the installer
    cls
    echo.
    echo Installing...

    cd "%temp%\ROTWETemp" > NUL 2>&1
    if exist "RobloxPlayerInstaller.exe" (
        start /wait /min RobloxPlayerInstaller.exe
        rem Waiting for it to complete
        timeout /t 1 /nobreak>nul
        taskkill /f /im RobloxPlayerBeta.exe > NUL 2>&1
        cls
        echo.
        echo Installation Complete.
        echo.
        echo If You Ecountered Errors When Installing, Please Restore Everything By Choosing [ RS ] In Reinstallation Menu.
        echo.
        echo [ Press Any Key To Go Back ]
        pause>nul
        goto menu
    )
    rem Roblox installer is not found, Downloading one and then going back
    cls
    echo.
    echo Installer Not Found.
    echo.
    echo Downloading Installer...
    powershell -command Invoke-WebRequest -URI "https://www.roblox.com/download/client" -OutFile "%temp%\ROTWETemp\RobloxPlayerInstaller.exe"
    goto startInstaller
    


:requirementsCheck
title Hi %username%, Please Wait While This Program Is Checking For Requirements
cls
echo.
echo Checking For Program Requirements...

cd "C:\Program Files"
rem Add more script below, (Later)