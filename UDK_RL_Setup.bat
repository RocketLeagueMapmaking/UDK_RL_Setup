@ECHO OFF
chcp 65001 >NUL

REM This is a comment. Welcome to the script!

ECHO. 
ECHO ############################################################################
ECHO. 

REM Here's a cool logo to draw in the console, in color!

setlocal disableDelayedExpansion
set q=^"

call :c 02 "                                      │" /n
call :c 02 "                                      │" /n
call :c 02 "                                      │" /n
call :c 02 "                                      ║" /n
call :c 02 "                                      ║" /n
call :c 02 "                                     │"&call :c 07 "▐"&call :c 02 "│" /n
call :c 02 "                                     │"&call :c 07 "▐"&call :c 02 "│" /n
call :c 02 "                                     │"&call :c 07 "▐"&call :c 02 "│" /n
call :c 02 "                                     │"&call :c 07 "▐"&call :c 02 "│" /n
call :c 02 "                                     │"&call :c 07 "▐"&call :c 02 "│" /n
call :c 02 "                                    │ "&call :c 07 "▐█"&call :c 02 "│" /n
call :c 02 "                                    │ "&call :c 07 "▐█"&call :c 02 "│" /n
call :c 02 "                                    │ "&call :c 07 "▐█"&call :c 02 "│" /n
call :c 02 "                                 ▄▄▄│ "&call :c 07 "▐█"&call :c 02 "│▄▄▄" /n
call :c 02 "                          ▄▄▄▄▀▀▀"&call :c 07 "▀▀▀"&call :c 02 "│ "&call :c 07 "▐█"&call :c 02 "│"&call :c 07 "▀▀▀"&call :c 02 "▀▀▀▄▄▄▄" /n
call :c 02 "                       ▄▀▀"&call :c 07 "▀▀"&call :c 02 "       │  "&call :c 07 "▐██"&call :c 02 "│       "&call :c 07 "▀▀"&call :c 02 "▀▀▄" /n
call :c 02 "                      ▐"&call :c 07 "▌▀"&call :c 02 "   ╲      │  "&call :c 07 "▐██"&call :c 02 "│      ╱   "&call :c 07 "▀▐"&call :c 02 "▌" /n
call :c 02 "                     ▐"&call :c 07 "▌"&call :c 02 "      ╲"&call :c 07 "▀▄"&call :c 02 "   │  "&call :c 07 "▐██"&call :c 02 "│    ╱"&call :c 07 "▄▀"&call :c 02 "     "&call :c 07 "▐"&call :c 02 "▌ " /n
call :c 02 "                     ▐"&call :c 07 "▌"&call :c 02 "       ╲ "&call :c 07 "█▄"&call :c 02 " │  "&call :c 07 "▐██"&call :c 02 "│  ╱ "&call :c 07 "▄▀"&call :c 02 "      "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                    ▐"&call :c 07 "▌"&call :c 02 "         ╲ "&call :c 07 "▀█"&call :c 02 "│  "&call :c 07 "▐██"&call :c 02 "│ ╱ "&call :c 07 "█▀"&call :c 02 "        "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                    ▐"&call :c 07 "▌"&call :c 02 "          ╲_"&call :c 07 "▀"&call :c 02 "╲  "&call :c 07 "▐██"&call :c 02 "╱ "&call :c 07 "▄█"&call :c 02 "          "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                   ▐"&call :c 07 "▌"&call :c 02 "  ___"&call :c 07 "▄▄▄███████"&call :c 02 "╲ "&call :c 07 "▐█"&call :c 02 "╱‾‾‾‾────____   ▐▌" /n
call :c 02 "              ___"&call :c 07 "▄▄▄█████████████████"&call :c 02 "╲"&call :c 07 "▐"&call :c 02 "╱             ‾‾‾‾────__" /n
call :c 02 "        ───═══"&call :c 07 "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"&call :c 02 "╳"&call :c 07 "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"&call :c 02 "═══───" /n
call :c 02 "              ‾‾────____             ╱"&call :c 07 "▌"&call :c 02 "╲"&call :c 07 "█████████████████▀▀▀"&call :c 02 "‾‾‾" /n
call :c 02 "                   ▐"&call :c 07 "▌"&call :c 02 "   ‾‾‾‾────____╱"&call :c 07 "█▌"&call :c 02 " ╲"&call :c 07 "███████▀▀▀"&call :c 02 "‾‾‾  ▐▌" /n
call :c 02 "                    ▐"&call :c 07 "▌"&call :c 02 "           "&call :c 07 "█"&call :c 02 " │"&call :c 07 "██▌"&call :c 02 "  │"&call :c 07 "▄"&call :c 02 "‾‾╲         "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                    ▐"&call :c 07 "▌"&call :c 02 "         "&call :c 07 "▄█"&call :c 02 " ╱│"&call :c 07 "██▌"&call :c 02 "  │"&call :c 07 "▀█▄"&call :c 02 " ╲        "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                     ▐"&call :c 07 "▌"&call :c 02 "       "&call :c 07 "▄▀"&call :c 02 " ╱ │"&call :c 07 "██▌"&call :c 02 "  │  "&call :c 07 "▀█"&call :c 02 " ╲      "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                     ▐"&call :c 07 "▌ "&call :c 02 "     "&call :c 07 "▄▀"&call :c 02 "╱    │"&call :c 07 "█▌"&call :c 02 " │     "&call :c 07 "▀▄"&call :c 02 "╲     "&call :c 07 "▐"&call :c 02 "▌" /n
call :c 02 "                      ▐"&call :c 07 "▌▄"&call :c 02 "    ╱      │"&call :c 07 "█▌"&call :c 02 " │        ╲  "&call :c 07 "▄▐"&call :c 02 "▌" /n
call :c 02 "                       ▀▄▄"&call :c 07 "▄▄"&call :c 02 "        │"&call :c 07 "█▌"&call :c 02 " │        "&call :c 07 "▄▄"&call :c 02 "▄▄▀" /n
call :c 02 "                          ▀▀▀▀▄▄▄"&call :c 07 "▄▄▄▄"&call :c 02 "│"&call :c 07 "▌"&call :c 02 "│"&call :c 07 "▄▄▄▄"&call :c 02 "▄▄▄▀▀▀▀" /n
call :c 02 "                                 ▀▀▀▀│"&call :c 07 "▌"&call :c 02 "│▀▀▀▀" /n
call :c 02 "                                     │"&call :c 07 "▌"&call :c 02 "│" /n
call :c 02 "                                      ║" /n
call :c 02 "                                      │" /n
call :c 02 "                                      │" /n

GOTO Start

:c
setlocal enableDelayedExpansion

REM ############################################################################

REM https://stackoverflow.com/questions/4339649/how-to-have-multiple-colors-in-a-windows-batch-file

:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"

REM The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b                                        











REM ############################################################################

REM             THIS IS THE START OF THE ACTUAL SCRIPT

REM ############################################################################

:Start
ECHO. 

REM ############################################################################

REM             Print out some info and a friendly reminder

REM ############################################################################

ECHO ############################################################################
ECHO. 
ECHO               UDK Setup Script for Rocket League Mapmaking
ECHO.
ECHO                              By Mr. Swaggles
ECHO.
call :c 02 "##################################"&call :c 07 " STEP 1 "&call :c 02 "##################################" /n
ECHO.
ECHO Please take a minute to review this script (but don't change it!)
ECHO.
call :c 07 ".BAT files you don't understand can do "&call :c 0C "terrible"&call :c 07 " things"
ECHO.
ECHO.
ECHO You can stop at any point with Ctrl+C or by closing the window
ECHO.
PAUSE
ECHO.

REM Open this file in notepad
START notepad %0
PAUSE
ECHO.

REM ############################################################################

REM             Install UDK if it isn't there already

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 2 "&call :c 02 "##################################" /n
ECHO.
ECHO Once you finish we'll start the UDK install . . .
ECHO.

SET udkinstalled=
SET /p udkinstalled="Do you already have UDK installed? (y/n): "
IF "%udkinstalled%" == "y" (
    ECHO.
    ECHO Fantastic news! Now to make some changes . . .
    ECHO.
    GOTO SkipUDKInstaller
    ECHO Skipping UDK install step
    ECHO.
)

:NotUDKInstaller
ECHO.


REM Look for the UDK Installer program and start it
if exist UDKInstall-2013-02-BETA.exe (
    ECHO Got it! Opening the installer . . .
    ECHO.
    START UDKInstall-2013-02-BETA.exe
    GOTO GotUDKInstaller
) else (
    ECHO Could not find UDK Installer . . .
    ECHO.
    CALL :DownloadUDK
    ECHO.
    ECHO Move the UDK Installer to this folder pls
    ECHO.
    PAUSE
    GOTO NotUDKInstaller
)

:DownloadUDK
SET udkdownload=
SET /p udkdownload="Would you like to download the UDK Installer? (y/n): "
IF "%udkdownload%" == "y" (
    START "" "%cd%\Goodies\UDK-2013-02-BETA_Download.url"
    ECHO.
    ECHO Downloading . . .
    ECHO.
    PAUSE
    GOTO NotUDKInstaller
)

:GotUDKInstaller
ECHO Continue onward once UDK finishes installing. Close the program . . .
ECHO.
PAUSE

:SkipUDKInstaller


REM ############################################################################

REM             Move Dummy Classes into the UDK install folder

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 3 "&call :c 02 "##################################" /n
:NotUDK
ECHO.
SET /p udkdir="Enter Install Location, including the Project Name (ex. C:\UDK\RLMods): "
ECHO.
ECHO Looking in %udkdir% . . .
ECHO.

IF EXIST "%udkdir%\Binaries\Win64\UDK.exe" (
    ECHO Got it!
    GOTO GotUDK
) ELSE (
    REM Retry if you typed the wrong thing or if it's not there
    ECHO Did you type the project name at the end? ^(e.g. \CustomGame^)
    GOTO NotUDK
)

:GotUDK
TIMEOUT /T 1 > NUL

ECHO.
REM Check for DummyClasses in a few places
call :c 02 "##################################"&call :c 07 " STEP 4 "&call :c 02 "##################################" /n
:NotClasses
ECHO.
ECHO Looking for RL Dummy Classes . . .
ECHO.
TIMEOUT /T 1 > NUL

SET classesdir=
IF EXIST "%cd%\RL-Dummy-Classes-v3\README.md" (
    SET classesdir=RL-Dummy-Classes-v3
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-v3-master\README.md" (
    SET classesdir=RL-Dummy-Classes-v3-master
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-v3-master\RL-Dummy-Classes-v3\README.md" (
    SET classesdir=RL-Dummy-Classes-v3-master\RL-Dummy-Classes-v3
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-v3-master\RL-Dummy-Classes-v3-master\README.md" (
    SET classesdir=RL-Dummy-Classes-v3-master\RL-Dummy-Classes-v3-master
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE (
    ECHO Folder not found. Please download it to %cd% and unzip it . . .
    START /Wait "" "%cd%\Goodies\RL-Dummy-Classes-v3_Download.url"
    PAUSE
    GOTO NotClasses
)

:GotClasses

REM Copy DummyClasses into the UDK install folder using Robocopy

ECHO Copying Dummy Classes into UDK . . .
ROBOCOPY "%cd%\%classesdir% " "%udkdir%\Development\Src " /E /NFL /NDL /NJH /xf README.md /xd .git
ECHO ------------------------------------------------------------------------------
ECHO.
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                       Modify several Unreal files

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 5 "&call :c 02 "##################################" /n
ECHO.

REM Modify DefaultEngine.ini with additions from DummyClasses

ECHO Modifying DefaultEngine.ini . . .
ECHO.
pushd %~dp0
CSCRIPT //NoLogo Goodies\ModifyDefaultEngine.vbs "%udkdir%\UDKGame\Config\DefaultEngine.ini"
TIMEOUT /T 1 > NUL

REM Modify StaticMeshActor.uc

ECHO Modifying StaticMeshActor.uc . . .
ECHO.
pushd %~dp0
CSCRIPT //NoLogo Goodies\ModifyStaticMeshActor.vbs "%udkdir%\Development\Src\Engine\Classes\StaticMeshActor.uc"
TIMEOUT /T 1 > NUL

REM Modify Actor.uc

ECHO Modifying Actor.uc . . .
ECHO.
pushd %~dp0
CSCRIPT //NoLogo Goodies\ModifyActor.vbs "%udkdir%\Development\Src\Engine\Classes\Actor.uc"
TIMEOUT /T 1 > NUL

REM Modify PrimitiveComponent.uc

ECHO Modifying PrimitiveComponent.uc . . .
ECHO.
pushd %~dp0
CSCRIPT //NoLogo Goodies\ModifyPrimitiveComponent.vbs "%udkdir%\Development\Src\Engine\Classes\PrimitiveComponent.uc"
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                       Set up project folders

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 6 "&call :c 02 "##################################" /n

REM Check for DummyAssets

:NotAssets
ECHO.
ECHO Looking for RL Dummy Assets . . .
ECHO.

SET assetsdir=
IF EXIST "%cd%\RL_DummyAssets\README.md" (
    SET assetsdir=RL_DummyAssets
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\README.md" (
    SET assetsdir=RL_DummyAssets-master
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\RL_DummyAssets\README.md" (
    SET assetsdir=RL_DummyAssets-master\RL_DummyAssets
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\RL_DummyAssets-master\README.md" (
    SET assetsdir=RL_DummyAssets-master\RL_DummyAssets-master
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE (
    ECHO Folder not found. Please download it to %cd% and unzip it . . .
    ECHO.
    START /Wait "" "%cd%\Goodies\RL_DummyAssets_Download.url"
    PAUSE
    GOTO NotAssets
)

:GotAssets


REM Copy DummyAssets into the UDK folder using Robocopy

ECHO Copying Dummy Assets into UDK . . .
ROBOCOPY "%cd%\%assetsdir% " "%udkdir%\UDKGame\Content\DummyAssets " /E /NFL /NDL /NJH /xf README.md /xd .git
ECHO ------------------------------------------------------------------------------
ECHO.
TIMEOUT /T 1 > NUL

REM Ask for RL install location

:NotRL
ECHO.
SET /p rldir="Enter Rocket League Install Location (ex. C:\Program Files (x86)\Steam\steamapps\common\rocketleague): "
ECHO.
ECHO Looking in %rldir% . . .
ECHO.

IF EXIST "%rldir%\Binaries\RocketLeague.exe" (
    ECHO Got it!
    GOTO GotRL
) ELSE (
    REM Retry if you typed the wrong thing or if it's not there
    ECHO Not there. Try Steam ^> Right click RL ^> Properties ^> Local Files ^> Browse Local Files
    GOTO NotRL
)

:GotRL
ECHO.

ECHO Creating mods folder in CookedPCConsole . . .

MKDIR "%rldir%\TAGame\CookedPCConsole\mods"

ECHO.
TIMEOUT /T 1 > NUL

REM Copy DummyAssets into the UDK folder using Robocopy

ECHO Creating backup of Labs_Utopia_P . . .
ROBOCOPY "%rldir%\TAGame\CookedPCConsole " "%udkdir%\UDKGame\Content\Maps " /NFL /NDL /NJH Labs_Utopia_P.upk
ECHO ------------------------------------------------------------------------------
ECHO.
TIMEOUT /T 1 > NUL

REN "%udkdir%\UDKGame\Content\Maps\Labs_Utopia_P.upk" BACKUP_Labs_Utopia_P.upk
DEL "%udkdir%\UDKGame\Content\Maps\Labs_Utopia_P.upk" > NUL
ECHO.

REM ############################################################################

REM                    Create a bunch of useful shortcuts

REM ############################################################################


REM Create shortcut to CookedPCConsole and put it UDK Maps folder
ECHO Creating shortcuts to CookedPCConsole . . .
ECHO.

SET SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

ECHO Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
ECHO sLinkDest = "%udkdir%\UDKGame\Content\Maps\CookedPCConsole.lnk" >> %SCRIPT%
ECHO Set oLink = oWS.CreateShortcut(sLinkDest) >> %SCRIPT%
ECHO oLink.TargetPath = "%rldir%\TAGame\CookedPCConsole" >> %SCRIPT%
ECHO oLink.Save >> %SCRIPT%

CSCRIPT /nologo %SCRIPT%
DEL %SCRIPT%


REM Create shortcuts to Steam Workshop and put it UDK Maps and RL Mods folders
ECHO Creating shortcuts to Steam Workshop . . .
ECHO.
SET "scriptdir=%cd%"

CD /D "%rldir%"
CD ..
CD ..
CD workshop
CD content
CD "252950"
SET "workshopdir=%cd%"
CD /D "%scriptdir%"

SET SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

ECHO Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
ECHO sLinkDest = "%udkdir%\UDKGame\Content\Maps\RLWorkshop.lnk" >> %SCRIPT%
ECHO Set oLink = oWS.CreateShortcut(sLinkDest) >> %SCRIPT%
ECHO oLink.TargetPath = "%workshopdir%" >> %SCRIPT%
ECHO oLink.Save >> %SCRIPT%

CSCRIPT /nologo %SCRIPT%
DEL %SCRIPT%

SET SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

ECHO Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
ECHO sLinkDest = "%rldir%\TAGame\CookedPCConsole\mods\RLWorkshop.lnk" >> %SCRIPT%
ECHO Set oLink = oWS.CreateShortcut(sLinkDest) >> %SCRIPT%
ECHO oLink.TargetPath = "%workshopdir%" >> %SCRIPT%
ECHO oLink.Save >> %SCRIPT%

CSCRIPT /nologo %SCRIPT%
DEL %SCRIPT%


REM Create shortcut to UDK Maps folder and put it up a few levels
ECHO Creating shortcuts to UDK Maps and a good folder structure . . .
ECHO.

CD "%udkdir%"
CD ..
SET "udkrootdir=%cd%"
MKDIR Workshop
CD Workshop
MKDIR Template
CD ..
MKDIR Assets
CD Assets
MKDIR Textures
MKDIR Meshes
CD Meshes
MKDIR DefaultMap
MKDIR Test
CD /D "%scriptdir%"

SET SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

ECHO Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
ECHO sLinkDest = "%udkrootdir%\UDK Maps.lnk" >> %SCRIPT%
ECHO Set oLink = oWS.CreateShortcut(sLinkDest) >> %SCRIPT%
ECHO oLink.TargetPath = "%udkdir%\UDKGame\Content\Maps" >> %SCRIPT%
ECHO oLink.Save >> %SCRIPT%

CSCRIPT /nologo %SCRIPT%
DEL %SCRIPT%

TIMEOUT /T 1 > NUL

ECHO Creating UtopiaOverwrite Script . . .
ECHO.

PUSHD %~dp0
cscript //NoLogo Goodies\BuildUtopiaOverwrite.vbs "%udkdir%\UDKGame\Content\Maps" "%rldir%\TAGame\CookedPCConsole\Labs_Utopia_P.upk"
TIMEOUT /T 1 > NUL

REM ############################################################################

REM               Set up Workshop uploading folder

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 7 "&call :c 02 "##################################" /n

SET steamcmddownload=
SET /p steamcmddownload="Would you like to download SteamCMD (for uploading maps)? (y/n): "
    ECHO.
IF "%steamcmddownload%" == "y" (
    START "" "%cd%\Goodies\SteamCmd_Download.url"
    ECHO Downloading . . .
    ECHO.
    ECHO Please refer to a guide for how to use SteamCmd . . .
    ECHO.
    PAUSE
    ECHO.
)

ECHO Creating Template Workshop Folder . . .
ECHO.
PUSHD %~dp0
cscript //NoLogo Goodies\BuildTemplateVDF.vbs "%udkrootdir%\Workshop\Template"
TIMEOUT /T 1 > NUL

ROBOCOPY "%scriptdir%\Goodies " "%udkrootdir%\Workshop\Template " /NFL /NDL /NJH UDK_Default.png
ECHO ------------------------------------------------------------------------------
ECHO.
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                   Open UDK Frontend Program

REM ############################################################################

call :c 02 "##################################"&call :c 07 " STEP 8 "&call :c 02 "##################################" /n
ECHO.
ECHO Opening UDK Frontend. Please run a Full Recompile . . .
ECHO.
call :c 02 "|‾‾‾‾‾‾‾‾‾‾|" /n
call :c 02 "|    ██    |" /n
call :c 02 "| "&call :c 07 "Script ▼"&call :c 02 " |" /n
call :c 02 "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|" /n
call :c 02 "|  "&call :c 07 "Full recompile"&call :c 02 "  |" /n
call :c 02 " ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ " /n
ECHO.

CD /D "%udkdir%\Binaries"
START UnrealFrontend.exe

CD /D "%scriptdir%"

PAUSE
ECHO.


REM This is the end :'(
:TheEnd
call :c 02 "##################################"&call :c 07 " THE END "&call :c 02 "#################################" /n
ECHO.
ECHO gg
ECHO.
PAUSE





