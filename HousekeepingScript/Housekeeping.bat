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
echo  *                 Housekeeping Script                 *
echo  *                                                     *
echo. *  Please read the README.txt file before proceeding! *
echo  *  This script will load global settings into your    *
echo  *  Reality Capture program and specify a Cache        *
echo  *  location.                                          *
echo  *                                                     *
echo. *  You will be asked a few questions in order to      * 
echo. *  maintain proper organization.                      *
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

:: run Reality Capture
%RealityCaptureExe% -set "appQuitOnError=true" -set "appQuitOnReset=true" -set "suppressErrors=true" -importGlobalSettings %Settings% -quit
%RealityCaptureExe% -set "appQuitOnReset=true" -set "appCacheLocation=Custom" -quit
%RealityCaptureExe% -set "appQuitOnReset=true" -set "appCacheCustomLocation=%USERCACHEPATH%" -quit

echo Your script has finished.
echo: 
echo                /@\                      
echo               /@@@\                     
echo              /@@@@@\                    
echo             /@@@@@@@\                   
echo            /@@@@@@@@/                    
echo           /@@@@@@@@/                     
echo          /@@@@@@@@/    _____                 
echo         /@@@@@@@@/   /@@@@@@@\             
echo        /@@@@@@@@/   /@@@@@@@@@\            
echo       /@@@@@@@@/________________                          
echo      /@@@@@@@@@@@@@@@@@@@@@@@@@@@\        
echo     /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\       
echo    /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\  
echo:
pause