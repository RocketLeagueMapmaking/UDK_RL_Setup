@ECHO OFF
chcp 65001 >NUL

GOTO TestTestTestTest

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
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
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

REM GOTO TestTestTestTest

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
ECHO .BAT files you don't understand can do terrible things
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
    ECHO Got it!
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
GOTO :eof

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
SET /p udkdir="Enter Install Location (ex. C:\UDK\RLMods): "
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


ECHO.
REM Check for DummyClasses in a few places
call :c 02 "##################################"&call :c 07 " STEP 4 "&call :c 02 "##################################" /n
:NotClasses
ECHO.
ECHO Looking for RL Dummy Classes . . .
ECHO.

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
) ELSE (
    ECHO Folder not found. Please download it to %cd%
    START /Wait "" "%cd%\Goodies\RL-Dummy-Classes-v3_Download.url"
    PAUSE
    GOTO NotClasses
)

:GotClasses

REM Copy DummyClasses into the UDK install folder using Robocopy

ECHO Copying Dummy Classes into UDK . . .
ROBOCOPY %cd%\%classesdir%\ %udkdir%\Development\Src /E /NFL /NDL /NJH /xf README.md /xd .git
ECHO ------------------------------------------------------------------------------
ECHO.

:TestTestTestTest
ECHO Skipping a bunch of stuff . . .

REM Modify DefaultEngine.ini with additions from DummyClasses

ECHO Modifying DefaultEngine.ini
pushd %~dp0
cscript //NoLogo Goodies\ModifyDefaultEngine.vbs %udkdir%\UDKGame\Config\DefaultEngine.ini

REM Check for DummyAssets
REM Move DummyAssets and Park_P
REM Ask for RL install location (verify)
REM Set up Maps folder
REM Add UtopiaOverwrite script
REM Back up Labs_Utopia_P.upk
REM Add mods folder to RL
REM Bring up UDK Frontend for Full Recompile


REM This is the end :'(
:TheEnd
call :c 02 "##################################"&call :c 07 " THE END "&call :c 02 "#################################" /n
ECHO.
ECHO gg
ECHO.
PAUSE





