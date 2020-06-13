@ECHO OFF
REM This is a comment. Welcome to the script!

:::                                 ,                               
:::                                ,,                               
:::                                ,*,                              
:::                                ,(,                              
:::                               ,,%,                              
:::                               ,.%*,                             
:::                               , %#,                             
:::                              ,, %@,                             
:::                              ,. %@,,                            
:::                              ,  %@/,                            
:::                       .@@@@@@,  &@@,@@@@@#                      
:::                    @@@@#,,,,,,  %@@,,,,,,%@@@@                  
:::                 ,,,%,,,,,,,,,   %@@,,,,,,,,,,&,,*               
:::               @@@*,./,,,,,,,,   %@@&,,,,,,,,.,,(@@#             
:::             ,@@/,,,,,.#%,,,,,   %@@@,,,,, %*,,,,,@@@            
:::            ,@@,,,,,,,,,  @@,    %@@@,,  @/,,,,,,,,/@@           
:::            @@*,,,,,,,,,,,.,,    %@@@/,*/,,,,,,,,,,,%@@          
:::           (/,,,,*(%@@@@@@@@@@,, &@,.           ..,,,,*.         
::: ,,,,*//***///****************//,,(%%################%%#####*,,,,
:::           %%(,,,,,.          ,*@* ,*@@@@@@@@@%/*,,,,(%          
:::            @@/,,,,,,,,,,,%(,&@@@*   .,. ,,,,,,,,,,,%@@          
:::            ,@@,,,,,,,,,&@  ,,@@@*   ,,@@ .,,,,,,,,(@@           
:::             .@@(,,,,,&..,,,,,@@@*  .,,,,,%(.,,,,,@@@            
:::               @@@*,#,,,,,,,,,,@@*  ,,,,,,,,,/.,#@@(             
:::                 ,,*&,,,,,,,,,,@@*  ,,,,,,,,,,@,,.               
:::                    @@@@%,,,,,,/@* ,,,,,,,&@@@&                  
:::                        %@@@@@@,@* ,@@@@@@/                      
:::                               ,(,,                              
:::                                ,*,                              
:::                                ,*,                              
:::                                 ,                               
:::

REM Print out the cool ascii art
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

REM Print out a friendly reminder
ECHO ##################################################################
ECHO. 
ECHO          UDK Setup Script for Rocket League Mapmaking
ECHO.
ECHO                         By Mr. Swaggles
ECHO.
ECHO ############################# STEP 1 #############################
ECHO.
ECHO Please take a minute to review this script (but don't change it!)
ECHO.
ECHO       .BAT files you don't understand can do terrible things
ECHO.
ECHO               You can stop it at any point with Ctrl+C
ECHO.
PAUSE

REM Open this file in notepad
START notepad %0
ECHO ############################# STEP 2 #############################
ECHO.
ECHO Once you finish we'll start the UDK install . . .
ECHO.
PAUSE
ECHO.

if exist UDKInstall-2013-02-BETA.exe (
    START UDKInstall-2013-02-BETA.exe
) else (
    ECHO Put the UDK Installer in this folder and retry, pls
    GOTO TheEnd
)


REM Ask for the installation folder for UDK
ECHO ############################# STEP 3 #############################
:NotIt
ECHO.
set /p udkdir="Enter Install Location (ex. C:\UDK\RLMods): "
ECHO Looking in %udkdir%

if exist %udkdir%\Binaries\Win64\UDK.exe (
    ECHO Got it!
    GOTO GotIt
) else (
    REM Retry if you typed the wrong thing
    ECHO Not it!
    GOTO NotIt
)

:GotIt
ECHO.
ECHO ##################################################################




REM This is the end :'(
:TheEnd
ECHO.
ECHO ##################################################################
ECHO.
PAUSE