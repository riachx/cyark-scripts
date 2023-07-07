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
echo  *                 Housekeeping Script                 *
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

:: use the instance name if you do not want to save project and instead you want to run the open RC.exe
:: this might be useful in cases where you only want to open RC once, and also not save the project at all.
:: -setInstanceName "RC_Clean_Template"^

%RealityCaptureExe% -newScene^ 
    -set "appQuitOnError=true"^
    -importGlobalSettings "Global_Settings.rcconfig"^
    -save %Project%^
    -clearCache 
    -quit

pause

::if /i "%EMAIL%" == "Y" ()
:: maybe a loop method of doing realitycapturexe then -load scene and save this scene per loop. save scene above loop too.