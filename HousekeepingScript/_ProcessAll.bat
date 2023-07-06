:CapturingReality

:: switch off console output
@echo off

echo  *******************************************************
echo  *   Welcome to Reality Capture - Housekeeping Script  *
echo  *******************************************************
echo. *                                                     *
echo  * This script will save alignment settings, pull a    *
echo  * license, import images, align components, and       *
echo. * export components.                                  *
echo  *                                                     *
echo. * You will be asked what drive to use and what your   *
echo. * project is named in order to maintain proper        *
echo. * organization.                                       *
echo  *                                                     *
echo  * For help and troubleshooting, refer to the README.  *
echo  *                                                     *
echo  * Please make sure that Reality Capture is installed  *
echo  * and properly configured before running this script. *
echo  *                                                     *
echo  *******************************************************
echo  *        Script developed and owned by CyArk.         *
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
    %RealityCaptureExe% -set "appQuitOnError=true" -addFolder "%%i" -align^
    -selectMaximalComponent -renameSelectedComponent "Component_!componentOrder!"^
    -exportSelectedComponent "%ComponentFolder%" -clearCache -quit
    set /a componentOrder+=1
)

pause

::if /i "%EMAIL%" == "Y" ()