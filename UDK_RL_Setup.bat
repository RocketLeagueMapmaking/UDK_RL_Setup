@ECHO OFF
CHCP 65001 > NUL

REM This is a comment. Welcome to the script!

REM Here's a cool logo to draw in the console!

setlocal disableDelayedExpansion

REM ############################################################################

REM             THIS IS THE START OF THE ACTUAL SCRIPT

REM ############################################################################


ECHO. 

REM ############################################################################

REM             Print out some info and a friendly reminder

REM ############################################################################

ECHO. 
ECHO               UDK Setup Script for Rocket League Mapmaking
ECHO.
ECHO                              By Mr. Swaggles
ECHO.
ECHO STEP 1
ECHO.
TIMEOUT /T 1 > NUL
ECHO You can stop at any point with Ctrl+C or by closing the window
ECHO.
ECHO started > log.txt
PAUSE
ECHO.

REM ############################################################################

REM             Install UDK if it isn't there already

REM ############################################################################

ECHO STEP 2
ECHO.
ECHO Once you're ready we'll start the UDK install . . .
ECHO.
ECHO printed step 2 text > log.txt

SET udkinstalled=
SET /p udkinstalled="Do you already have UDK installed? (y/n): "
IF "%udkinstalled%" == "y" (
    ECHO udkinstalled: y >> log.txt
    ECHO.
    ECHO Fantastic news! Now to make some changes . . .
    ECHO.
    GOTO SkipUDKInstaller
    ECHO Skipping UDK install step
    ECHO.
)

:NotUDKInstaller
ECHO udkinstalled: n >> log.txt
ECHO.


REM Look for the UDK 2015 Installer program and start it
if exist UDKInstall-2015-02.exe (
    ECHO udkinstallerfound: y >> log.txt
    ECHO Got it! Opening the installer . . .
    ECHO.
    START UDKInstall-2015-02.exe
    GOTO GotUDKInstaller
) else (
    ECHO udkinstallerfound: n >> log.txt
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
    START "" "https://drive.google.com/file/d/1ozqiKBgcWSgcq7X5J6g0AErKyevjMRwd/view?usp=sharing"
    ECHO.
    ECHO downloadudk: y >> log.txt
    ECHO Move it to this folder when it finished downloading . . .
    ECHO "(try a different browser if the download fails)"
    PAUSE
    GOTO NotUDKInstaller
)

:GotUDKInstaller
ECHO.
ECHO 1 - Select Empty Game for the Project type (we don't need the Starter content)
ECHO.
ECHO 2 - Type in a Project Name such as RLMM, RLMods, mods, or leave it as Custom
ECHO.
ECHO 3 - Make sure the Install Location matches the Project Name
ECHO.
ECHO 4 - Ignore the Perforce offers
ECHO.
ECHO 5 - Continue onward once UDK finishes installing (~2 minutes). Return to Desktop and/or close UDK after it completely finishes . . .
ECHO.
ECHO udkinstalled: y >> log.txt
PAUSE

:SkipUDKInstaller


REM ############################################################################

REM             Move Dummy Classes into the UDK install folder

REM ############################################################################

ECHO STEP 3
:NotUDK
ECHO.
SET /p udkdir="Enter Install Location, including the Project Name (e.g. C:\UDK\RLMM): "
ECHO.
ECHO Looking in %udkdir% . . .
ECHO.

IF EXIST "%udkdir%\Binaries\Win64\UDK.exe" (
    ECHO udkdir: y >> log.txt
    ECHO Got it!
    GOTO GotUDK
) ELSE (
    REM Retry if you typed the wrong thing or if it's not there
    ECHO udkdir: n >> log.txt
    ECHO Did you type the project name at the end? ^(e.g. \CustomGame^)
    GOTO NotUDK
)

:GotUDK
TIMEOUT /T 1 > NUL

ECHO.
REM Check for DummyClasses in a few places
ECHO STEP 4
:NotClasses
ECHO.
ECHO Looking for RL Dummy Classes . . .
ECHO.
TIMEOUT /T 1 > NUL

SET classesdir=
IF EXIST "%cd%\RL-Dummy-Classes\README.md" (
    ECHO dummyclasses: git >> log.txt
    SET classesdir=RL-Dummy-Classes
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-master\README.md" (
    ECHO dummyclasses: dl >> log.txt
    SET classesdir=RL-Dummy-Classes-master
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-master\RL-Dummy-Classes\README.md" (
    ECHO dummyclasses: nest >> log.txt
    SET classesdir=RL-Dummy-Classes-master\RL-Dummy-Classes
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%cd%\RL-Dummy-Classes-master\RL-Dummy-Classes-master\README.md" (
    ECHO dummyclasses: dlzip >> log.txt
    SET classesdir=RL-Dummy-Classes-master\RL-Dummy-Classes-master
    ECHO Got it!
    ECHO.
    GOTO GotClasses
) ELSE (
    ECHO dummyclasses: n >> log.txt
    ECHO Folder not found. Please download it to %cd% and unzip it . . .
    START /Wait "" "https://github.com/RocketLeagueMapmaking/RL-Dummy-Classes"
    PAUSE
    GOTO NotClasses
)

:GotClasses

REM Copy DummyClasses into the UDK install folder using Robocopy

ECHO Copying Dummy Classes into UDK . . .
ROBOCOPY "%cd%\%classesdir% " "%udkdir%\Development\Src " /E /NFL /NDL /NJH /xf README.md /xd .git

ECHO dummyclassescopied: y >> log.txt
TIMEOUT /T 1 > NUL
ECHO.
GOTO SkipComment

REM ############################################################################

REM                       Modify .ini File

REM ############################################################################

:SkipComment
ECHO STEP 5
ECHO.

REM Modify DefaultEngine.ini with additions from DummyClasses

ECHO Modifying DefaultEngine.ini . . .
ECHO.
pushd %~dp0
CSCRIPT //NoLogo Goodies\ModifyDefaultEngine.vbs "%udkdir%\UDKGame\Config\DefaultEngine.ini"
ECHO defaultengineini: y >> log.txt
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                       Set up project folders

REM ############################################################################

ECHO STEP 6

REM Check for DummyAssets

:NotAssets
ECHO.
ECHO Looking for RL Dummy Assets . . .
ECHO.

SET assetsdir=
IF EXIST "%cd%\RL_DummyAssets\README.md" (
    ECHO dummyassets: git >> log.txt
    SET assetsdir=RL_DummyAssets
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\README.md" (
    ECHO dummyassets: dl >> log.txt
    SET assetsdir=RL_DummyAssets-master
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\RL_DummyAssets\README.md" (
    ECHO dummyassets: nest >> log.txt
    SET assetsdir=RL_DummyAssets-master\RL_DummyAssets
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%cd%\RL_DummyAssets-master\RL_DummyAssets-master\README.md" (
    ECHO dummyassets: zip >> log.txt
    SET assetsdir=RL_DummyAssets-master\RL_DummyAssets-master
    ECHO Got it!
    ECHO.
    GOTO GotAssets
) ELSE (
    ECHO dummyassets: n >> log.txt
    ECHO Folder not found. Please download it to %cd% and unzip it . . .
    ECHO.
    START /Wait "" "https://github.com/Martinii89/RL_DummyAssets"
    PAUSE
    GOTO NotAssets
)

:GotAssets


REM Copy DummyAssets into the UDK folder using Robocopy

ECHO Copying Dummy Assets into UDK . . .
ROBOCOPY "%cd%\%assetsdir% " "%udkdir%\UDKGame\Content\DummyAssets " /E /NFL /NDL /NJH /xf README.md /xd .git
ECHO.
ECHO dummyassetscopied: y >> log.txt
TIMEOUT /T 1 > NUL

REM Ask for RL install location

ECHO.
ECHO In Steam, right click Rocket League ^> Properties ^> Local Files ^> Browse Local Files . . .
ECHO.
:NotRL
ECHO Copy the directory and paste it here . . .
ECHO.
SET /p rldir="Enter Rocket League Install Location (ex. C:\Program Files (x86)\Steam\steamapps\common\rocketleague): "
ECHO.
ECHO Looking in %rldir% . . .
ECHO.

IF EXIST "%rldir%\Binaries\Win64\RocketLeague.exe" (
    ECHO rldir: y >> log.txt
    ECHO Got it!
    GOTO GotRL
) ELSE (
    REM Retry if you typed the wrong thing or if it's not there
    ECHO rldir: n >> log.txt
    ECHO Not there. Try Steam ^> Right click RL ^> Properties ^> Local Files ^> Browse Local Files . . .
    GOTO NotRL
)

:GotRL
ECHO.

ECHO Creating mods folder in CookedPCConsole . . .

MKDIR "%rldir%\TAGame\CookedPCConsole\mods"
ECHO modsdir: y >> log.txt
ECHO.
TIMEOUT /T 1 > NUL

REM ############################################################################

REM                    Create a bunch of useful shortcuts

REM ############################################################################


REM Create shortcut to CookedPCConsole and put it UDK Maps folder
ECHO Creating shortcuts to CookedPCConsole . . .
ECHO.

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkdir%\UDKGame\Content\Maps\CookedPCConsole.lnk" "%rldir%\TAGame\CookedPCConsole"
ECHO cookedshortcut: y >> log.txt
TIMEOUT /T 1 > NUL

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

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkdir%\UDKGame\Content\Maps\RLWorkshop.lnk" "%workshopdir%"
ECHO workshopshortcut: y >> log.txt

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%rldir%\TAGame\CookedPCConsole\mods\RLWorkshop.lnk" "%workshopdir%"
ECHO workshopshortcut: y >> log.txt

TIMEOUT /T 1 > NUL

REM Create shortcut to UDK Maps folder and put it up a few levels
ECHO Creating shortcuts to UDK Maps and a good folder structure . . .
ECHO.

CD /D "%udkdir%"
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

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkrootdir%\UDK Maps.lnk" "%udkdir%\UDKGame\Content\Maps"
ECHO mapsshortcut: y >> log.txt

TIMEOUT /T 1 > NUL


ECHO Creating UtopiaOverwrite Script . . .
ECHO.

PUSHD %~dp0
CSCRIPT //NoLogo Goodies\BuildUtopiaOverwrite.vbs "%udkdir%\UDKGame\Content\Maps" "%rldir%\TAGame\CookedPCConsole\Labs_Utopia_P.upk"
ECHO utopiaoverwrite: y >> log.txt
TIMEOUT /T 1 > NUL


REM ############################################################################

REM               Set up Workshop uploading folder

REM ############################################################################

ECHO STEP 7
ECHO.

SET steamcmddownload=
SET /p steamcmddownload="Would you like to download SteamCMD (for uploading maps)? (y/n): "
    ECHO.
IF "%steamcmddownload%" == "y" (
    ECHO steamcmd: y >> log.txt
    START "" "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
    ECHO Downloading . . .
    ECHO.
    ECHO Please refer to this guide for how to use SteamCmd . . .
    START "" "https://www.reddit.com/r/RocketLeagueMods/comments/5hzin2/guide_how_to_update_your_steam_workshop_maps/"
    ECHO.
    PAUSE
    ECHO.
)

ECHO Creating Template Workshop Folder . . .
ECHO.
PUSHD %~dp0
cscript //NoLogo Goodies\BuildTemplateVDF.vbs "%udkrootdir%\Workshop\Template"
ECHO templatesdir: y >> log.txt
TIMEOUT /T 1 > NUL

ROBOCOPY "%scriptdir%\Goodies " "%udkrootdir%\Workshop\Template " /NFL /NDL /NJH UDK_Default.png
ECHO.
ECHO udkdefaultgrid: y >> log.txt
TIMEOUT /T 1 > NUL

REM Copy Labs_Utopia_P into the Workshop folder using Robocopy

ECHO Creating backup of Labs_Utopia_P . . .
ROBOCOPY "%rldir%\TAGame\CookedPCConsole " "%udkrootdir%\Workshop " /NFL /NDL /NJH Labs_Utopia_P.upk
ECHO.
ECHO utopiabackup: y >> log.txt
TIMEOUT /T 1 > NUL

REN "%udkrootdir%\Workshop\Labs_Utopia_P.upk" BACKUP_Labs_Utopia_P.upk > NUL
DEL "%udkrootdir%\Workshop\Labs_Utopia_P.upk" > NUL
ECHO.

REM ############################################################################

REM                   Open UDK Frontend Program

REM ############################################################################

ECHO STEP 8
ECHO.
ECHO Opening UDK Frontend. Do Script ^> Full Recompile from the top menu . . .
ECHO.

CD /D "%udkdir%\Binaries"
START UnrealFrontend.exe
ECHO unrealfrontend: y >> log.txt
CD /D "%scriptdir%"

PAUSE
ECHO.


REM This is the end :'(
:TheEnd
ECHO THE END
ECHO.
ECHO yeet: y >> log.txt
ECHO You may see some yellow warning text, but no red errors
ECHO The very bottom line should read: COMMANDLET 'UDK.exe make -full' SUCCEEDED
ECHO.
ECHO UDK is ready to go!
ECHO.
ECHO Close Unreal Frontend and open UDK!
ECHO.
ECHO gg
ECHO.
PAUSE
