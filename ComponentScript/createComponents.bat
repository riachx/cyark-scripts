::CapturingReality

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
echo  *  This script will import images, align them, and    *
echo  *  export components.                                 *
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

:: allows for componentOrder to increment
setlocal ENABLEDELAYEDEXPANSION

:: loops through each subfolder in Directory and aligns and exports each component.
for /d %%i in ("%Images%\*") do (
    :: Writes out in the Command Prompt which subfolder is currently being processed.
    echo Processing folder %%i
    %RealityCaptureExe% -set "appQuitOnError=true" -addFolder "%%i" -align -selectMaximalComponent -renameSelectedComponent "%Images%" -exportSelectedComponent "%ComponentFolder%" -clearCache -quit
)

echo Your script has finished.

pause