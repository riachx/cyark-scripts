:CapturingReality

:: switch off console output
@echo off

echo  *******************************************************
echo  *                    Welcome to                       * 
echo. *                                                     *                                                      
echo  *     #######  ##  ###   ######  ######   ##  ##      *
echo  *     ##  ###  ##  ###   ##  ##  ##  ##   ##  ##      *
echo  *     ##  ###  ##  ###   ##  ##  ##  ##   ## ##       *
echo  *     ##       #######  #######  #######  #######     *
echo  *     ##   ##    ###    ###  ##  ### ###  ##  ###     *
echo  *     ##   ##    ###    ###  ##  ### ###  ##  ###     *
echo  *     #######    ###    ###  ##  ### ###  ##  ###     *
echo. *                                                     *
echo  *******************************************************
echo  *                  Component Script                   *
echo  *                                                     *
echo. *  Please read the README.txt file before proceeding! *
echo  *  This script will save alignment settings, pull a   *
echo  *  license,                                           *
echo  *                                                     *
echo. *  You will be asked what drive to use and what your  *
echo. *  project is named in order to maintain proper       *
echo. *  organization.                                      *
echo  *                                                     *
echo  *  For help and troubleshooting, refer to the README. *
echo  *                                                     *
echo  *  Ensure that Reality Capture is installed and       *
echo  *  properly configured before running this script.    *
echo  *                                                     *
echo  *******************************************************
echo:

:: sets necessary paths
call SetVariables.bat

:: asks if user requests a notification when the script terminates
set /p EMAILBOOL="Do you want to receive an email when the script finishes? (Y/N) : "
if /i "%EMAILBOOL%" == "Y" (
    set /p "EMAILNAME =Enter your email address: "
    echo Email is "%EMAILNAME%"
)

:: allows for componentOrder to increment
setlocal ENABLEDELAYEDEXPANSION

:: stores the naming convention of Component, increases per loop
set componentOrder=1

:: loops through each subfolder in Directory and aligns and exports each component.
for /d %%i in ("%Images%\*") do (
    :: Writes out in the Command Prompt which subfolder is currently being processed.
    echo Processing folder %%i
    %RealityCaptureExe% -delegateTo-set  "appQuitOnError=true" 
    -addFolder "%%i"^
    -align^
    -selectMaximalComponent^
    -renameSelectedComponent "Component_!componentOrder!"^
    -exportSelectedComponent "%ComponentFolder%"^ 
    -clearCache^
    -quit^
    set /a componentOrder+=1
)

pause

::if /i "%EMAIL%" == "Y" ()
:: maybe a loop method of doing realitycapturexe then -load scene and save this scene per loop. save scene above loop too.