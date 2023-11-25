@ECHO OFF
CHCP 65001 > NUL
SETLOCAL EnableDelayedExpansion

REM This is a comment. Welcome to the script!

REM ############################################################################

REM     This script automatically restarts itself in Administrative mode

REM ############################################################################

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
SET URL=https://rocketleaguemapmaking.com/images/UDK/essential/dangerous.png
SET ZIP="%~dp0init.zip"
POWERSHELL -command "Invoke-WebRequest '%URL%' -OutFile '%ZIP%'"
DEL init.zip

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
ECHO You can stop at any point by closing the window
ECHO.
ECHO v20231123 > log.txt
PAUSE
ECHO.

REM ############################################################################

REM             Install UDK if it isn't there already

REM ############################################################################

ECHO.
ECHO STEP 2
ECHO.
ECHO Once you're ready we'll start the UDK install . . .
ECHO.

SET udkinstalled=
SET /p udkinstalled="Do you already have UDK installed? (y/n): "
IF "%udkinstalled%" == "y" (
    ECHO udkinstalled: y >> log.txt
    ECHO.
    ECHO Fantastic news^^! Now to make some changes . . .
    ECHO.
    GOTO SkipUDKInstaller
    ECHO.
)

:NotUDKInstaller
ECHO udkinstalled: n >> log.txt
ECHO.

REM Look for the UDK 2015 Installer program and start it
IF EXIST UDKInstall-2015-02.exe (
    ECHO udkinstallerfound: y >> log.txt
    ECHO Got it^^! Opening the installer . . .
    ECHO.
    START UDKInstall-2015-02.exe
    GOTO GotUDKInstaller
) ELSE (
    ECHO udkinstallerfound: n >> log.txt
    ECHO Could not find UDK Installer . . .
    ECHO.
    CALL :DownloadUDK
    ECHO.
    ECHO Move the UDK Installer to %~dp0
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
    ECHO Move it to %~dp0 after downloading . . .
    ECHO ^(try a different browser if the download fails^)
    PAUSE
    GOTO NotUDKInstaller
) ELSE (
    ECHO.
    ECHO downloadudk: n >> log.txt
    ECHO Please start the UDK Installer yourself . . .
    TIMEOUT /T 1 > NUL
)

:GotUDKInstaller
ECHO.
ECHO 1 - Select Empty Game for the Project type ^(Starter Content will break Rocket League^)
TIMEOUT /T 1 > NUL
ECHO.
ECHO 2 - Type in a Project Name with NO SPACES such as RLMM, RLMods, mods, or leave it as Custom
TIMEOUT /T 1 > NUL
ECHO.
ECHO 3 - Make sure the Install Location matches the Project Name
TIMEOUT /T 1 > NUL
ECHO.
ECHO 4 - Ignore the Perforce server and offers
TIMEOUT /T 1 > NUL
ECHO.
ECHO 5 - Continue onward once UDK finishes installing ^(2-5 minutes^). Select "Launch UDK" when it finishes.
TIMEOUT /T 1 > NUL
ECHO.
ECHO udkinstalled: y >> log.txt
PAUSE
ECHO.

:SkipUDKInstaller

ECHO.
ECHO STEP 3
:NotUDK
ECHO.
ECHO Locating UDK . . .
SETLOCAL

for /f "usebackq delims=" %%p in (`wmic process where "name='UDK.exe'"
                                   get executablePath /value 2^>nul ^| findstr ^=`) do (
  set %%p
)

IF DEFINED executablePath (
  ECHO.
  ECHO Found %executablePath%
  SET udkdir="%executablePath:~0,-24%"
  ECHO.
  GOTO GotUDK
)^
ELSE (
  ECHO.
  ECHO Please start UDK before continuing
  ECHO.
  PAUSE
  GOTO NotUDK
)

:GotUDK
ECHO Closing UDK . . .
ECHO.
TASKKILL /im UDK.exe > NUL
TIMEOUT /T 5 > NUL

REM ############################################################################

REM             Move Dummy Classes into the UDK install folder

REM ############################################################################

REM Check for DummyClasses in a few places
ECHO.
ECHO STEP 4
ECHO.
ECHO Downloading and unzipping Dummy Classes . . .
SET URL=https://github.com/RocketLeagueMapmaking/RL-Dummy-Classes/archive/refs/heads/master.zip
SET ZIP="%~dp0RL-Dummy-Classes.zip"
POWERSHELL -command "Invoke-WebRequest '%URL%' -OutFile '%ZIP%'"
CSCRIPT //NoLogo Goodies\UnzipArchive.vbs %ZIP% "%~dp0"
:NotClasses
ECHO.
TIMEOUT /T 1 > NUL

SET classesdir=
IF EXIST "%~dp0\RL-Dummy-Classes\README.md" (
    ECHO dummyclasses: git >> log.txt
    SET classesdir=RL-Dummy-Classes
    ECHO Got it^^!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%~dp0\RL-Dummy-Classes-master\README.md" (
    ECHO dummyclasses: dl >> log.txt
    SET classesdir=RL-Dummy-Classes-master
    ECHO Got it^^!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%~dp0\RL-Dummy-Classes-master\RL-Dummy-Classes\README.md" (
    ECHO dummyclasses: nest >> log.txt
    SET classesdir=RL-Dummy-Classes-master\RL-Dummy-Classes
    ECHO Got it^^!
    ECHO.
    GOTO GotClasses
) ELSE IF EXIST "%~dp0\RL-Dummy-Classes-master\RL-Dummy-Classes-master\README.md" (
    ECHO dummyclasses: dlzip >> log.txt
    SET classesdir=RL-Dummy-Classes-master\RL-Dummy-Classes-master
    ECHO Got it^^!
    ECHO.
    GOTO GotClasses
) ELSE (
    ECHO dummyclasses: n >> log.txt
    ECHO Folder not found. Please download it to %~dp0 and unzip it . . .
    START /Wait "" "https://github.com/RocketLeagueMapmaking/RL-Dummy-Classes"
    PAUSE
    GOTO NotClasses
)

:GotClasses

REM Copy DummyClasses into the UDK install folder using Robocopy
TIMEOUT /T 1 > NUL
ECHO Copying Dummy Classes into UDK . . .
ROBOCOPY "%~dp0\%classesdir% " "%udkdir%\Development\Src " /E /NFL /NDL /NJH /NJS /xf README.md /xd .git

ECHO dummyclassescopied: y >> log.txt
ECHO Making sure UDK is stopped; all good if UDK not found . . .
TASKKILL /im UDK.exe > NUL
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
CSCRIPT //NoLogo Goodies\ModifyDefaultEngine.vbs "%udkdir%\UDKGame\Config\DefaultEngine.ini"
ECHO defaultengineini: y >> log.txt
TIMEOUT /T 1 > NUL

REM Modify UDKEngine.ini to fix slow UDK loading

ECHO Modifying UDKEngine.ini . . .
ECHO.
ECHO.
CSCRIPT //NoLogo Goodies\ModifyUDKEngine.vbs "%udkdir%\UDKGame\Config\UDKEngine.ini"
ECHO udkengineini: y >> log.txt
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                       Set up project folders

REM ############################################################################

ECHO STEP 6
ECHO.

REM Check for NotSoDummyAssets
ECHO Downloading and unzipping Dummy Assets (may take several minutes). . .
SET URL=https://github.com/RocketLeagueMapmaking/RL_NotSoDummyAssets/archive/refs/heads/main.zip
SET ZIP="%~dp0RL_NotSoDummyAssets.zip"
POWERSHELL -command "Invoke-WebRequest '%URL%' -OutFile '%ZIP%'"
CSCRIPT //NoLogo Goodies\UnzipArchive.vbs %ZIP% "%~dp0"
:NotAssets
ECHO.

SET assetsdir=
IF EXIST "%~dp0\RL_NotSoDummyAssets\README.md" (
    ECHO dummyassets: git >> log.txt
    SET assetsdir=RL_NotSoDummyAssets
    ECHO Got it^^!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%~dp0\RL_NotSoDummyAssets-main\README.md" (
    ECHO dummyassets: dl >> log.txt
    SET assetsdir=RL_NotSoDummyAssets-main
    ECHO Got it^^!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%~dp0\RL_NotSoDummyAssets-main\RL_NotSoDummyAssets\README.md" (
    ECHO dummyassets: nest >> log.txt
    SET assetsdir=RL_NotSoDummyAssets-main\RL_NotSoDummyAssets
    ECHO Got it^^!
    ECHO.
    GOTO GotAssets
) ELSE IF EXIST "%~dp0\RL_NotSoDummyAssets-main\RL_NotSoDummyAssets-main\README.md" (
    ECHO dummyassets: zip >> log.txt
    SET assetsdir=RL_NotSoDummyAssets-main\RL_NotSoDummyAssets-main
    ECHO Got it^^!
    ECHO.
    GOTO GotAssets
) ELSE (
    ECHO dummyassets: n >> log.txt
    ECHO Folder not found. Please download it to %~dp0 and unzip it . . .
    ECHO.
    START /Wait "" "https://github.com/RocketLeagueMapmaking/RL_NotSoDummyAssets"
    PAUSE
    GOTO NotAssets
)

:GotAssets

REM Copy DummyAssets into the UDK folder using Robocopy
TIMEOUT /T 1 > NUL
ECHO Copying Dummy Assets into UDK . . .
ROBOCOPY "%~dp0\%assetsdir% " "%udkdir%\UDKGame\Content\DummyAssets " /E /NFL /NDL /NJH /NJS /xf README.md /xd .git
ECHO dummyassetscopied: y >> log.txt
TIMEOUT /T 1 > NUL

REM Ask for RL install location

ECHO.
:SteamOrEpic
SET /p steamepic="Steam or Epic Launcher (s/e): "

:NotRL
ECHO.
ECHO Locating Rocket League . . .
SETLOCAL
SET rldir=
set "executablePath="

for /f "usebackq delims=" %%p in (`wmic process where "name='RocketLeague.exe'"
                                   get executablePath /value 2^>nul ^| findstr ^=`) do (
  set %%p
)

IF DEFINED executablePath (
  ECHO.
  PUSHD %~dp0
  ECHO Found "%executablePath%"
  CALL :getFolder "%executablePath%"
  :GotFolder
  CD /D "%rldir%"
  CD ..
  CD ..
  SET "rldir=%cd%"
  POPD
  ECHO.
  GOTO GotRL
)^
ELSE (
  ECHO.
  ECHO Please start Rocket League before continuing
  ECHO.
  PAUSE
  GOTO NotRL
)

:getFolder
SET folder=%~dp1
SET "rldir=%folder%"
GOTO GotFolder

:GotRL
ECHO Closing Rocket League . . .
TASKKILL /im RocketLeague.exe > NUL
TIMEOUT /T 5 > NUL
ECHO.

ECHO Creating mods folder in CookedPCConsole . . .

MKDIR "%rldir%\TAGame\CookedPCConsole\mods"
ECHO modsdir: y >> log.txt
ECHO.
TIMEOUT /T 1 > NUL

REM ############################################################################

REM                    Create a bunch of useful shortcuts

REM ############################################################################

ECHO.
ECHO STEP 7
ECHO.

REM Create shortcut to CookedPCConsole and put it in UDK Maps folder
ECHO Creating shortcuts to CookedPCConsole . . .
ECHO.

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkdir%\UDKGame\Content\Maps\CookedPCConsole.lnk" "%rldir%\TAGame\CookedPCConsole"
ECHO cookedshortcut: y >> log.txt
TIMEOUT /T 1 > NUL

IF "%steamepic%" NEQ "s" (
    GOTO SkipWorkshopShortcuts
)

REM Create shortcuts to Steam Workshop and put it in UDK Maps and RL Mods folders
ECHO Creating shortcuts to Steam Workshop . . .
ECHO.

CD /D "%rldir%"
CD ..
CD ..
CD workshop
CD content
CD "252950"
SET "workshopdir=%cd%"
CD /D %~dp0

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkdir%\UDKGame\Content\Maps\RLWorkshop.lnk" "%workshopdir%"
ECHO workshopshortcut: y >> log.txt

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%rldir%\TAGame\CookedPCConsole\mods\RLWorkshop.lnk" "%workshopdir%"
ECHO workshopshortcut: y >> log.txt

TIMEOUT /T 1 > NUL


:SkipWorkshopShortcuts

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
MKDIR Audio
MKDIR Balls
MKDIR Cars
MKDIR Brushes
MKDIR Hats
MKDIR Maps
MKDIR Packs
MKDIR Test
MKDIR Textures
CD Maps
MKDIR MyFirstMap
CD /D %~dp0

CSCRIPT //NoLogo Goodies\CreateShortcut.vbs "%udkrootdir%\UDK Maps.lnk" "%udkdir%\UDKGame\Content\Maps"
ECHO mapsshortcut: y >> log.txt

TIMEOUT /T 1 > NUL

ECHO Creating UtopiaOverwrite Script . . .
ECHO.

PUSHD %~dp0
CSCRIPT //NoLogo Goodies\BuildUtopiaOverwrite.vbs "%udkdir%\UDKGame\Content\Maps" "%rldir%\TAGame\CookedPCConsole\Labs_Utopia_P.upk"
ECHO.
ECHO utopiaoverwrite: y >> log.txt
TIMEOUT /T 1 > NUL


REM ############################################################################

REM               Set up Workshop uploading folder

REM ############################################################################

ECHO STEP 8
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

ROBOCOPY "%~dp0\Goodies " "%udkrootdir%\Workshop\Template " /NFL /NDL /NJH /NJS UDK_Default.png
ECHO udkdefaultgrid: y >> log.txt
TIMEOUT /T 1 > NUL

REM Copy Labs_Utopia_P into the Workshop folder using Robocopy

ECHO Creating backup of Labs_Utopia_P . . .
ROBOCOPY "%rldir%\TAGame\CookedPCConsole " "%udkrootdir%\Workshop " /NFL /NDL /NJH /NJS Labs_Utopia_P.upk
ECHO.
ECHO utopiabackup: y >> log.txt
TIMEOUT /T 1 > NUL

REN "%udkrootdir%\Workshop\Labs_Utopia_P.upk" BACKUP_Labs_Utopia_P.upk > NUL


REM ############################################################################

REM                   Add map templates

REM ############################################################################

ECHO STEP 9
ECHO.
ECHO Adding map templates . . .
ECHO.

ECHO Copying Soccar Template . . .
ROBOCOPY "%~dp0\Goodies\Templates " "%udkdir%\Engine\Content\Maps\Templates " /NFL /NDL /NJH /NJS Template_Soccar.umap
ECHO.
ECHO templatesoccar: y >> log.txt
TIMEOUT /T 1 > NUL

ECHO Copying Hoops Template . . .
ROBOCOPY "%~dp0\Goodies\Templates " "%udkdir%\Engine\Content\Maps\Templates " /NFL /NDL /NJH /NJS Template_Hoops.umap
ECHO.
ECHO templatehoops: y >> log.txt
TIMEOUT /T 1 > NUL

ECHO Copying Test Template . . .
ROBOCOPY "%~dp0\Goodies\Templates " "%udkdir%\Engine\Content\Maps\Templates " /NFL /NDL /NJH /NJS Template_Test.umap
ECHO.
ECHO templatetest: y >> log.txt
TIMEOUT /T 1 > NUL

ECHO Copying Template List . . .
ROBOCOPY "%~dp0\Goodies\Templates " "%udkdir%\Engine\Content " /NFL /NDL /NJH /NJS MapTemplateIndex.upk
ECHO.
ECHO maptemplateindex: y >> log.txt
TIMEOUT /T 1 > NUL

ROBOCOPY "%~dp0\Goodies\Templates " "%udkdir%\Engine\Localization\INT " /NFL /NDL /NJH /NJS EditorMapTemplates.int
ECHO.
ECHO editormaptemplates: y >> log.txt
TIMEOUT /T 1 > NUL


REM ############################################################################

REM                   Recompile UDK

REM ############################################################################

ECHO STEP 10
ECHO.
ECHO Recompiling UDK with all of these changes
ECHO.
CD /D "%udkdir%\Binaries\Win64"
START UDK.exe make -full
ECHO.
ECHO The very bottom line should read: Success 0 error(s)
ECHO We don't care about the warnings
ECHO.
ECHO Close that console window
ECHO unrealfrontend: y >> log.txt
CD /D %~dp0
PAUSE
ECHO.
ECHO Let's launch UDK^^!

REM Start UDK
:UDKFrontEnd
ECHO.
CD /D "%udkdir%\Binaries"
START UDKLift.exe editor
ECHO.
ECHO gg
ECHO gg: y >> log.txt
ECHO.

REM This is the end :'(
:TheEnd
PAUSE
EXIT
