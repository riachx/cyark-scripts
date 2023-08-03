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
echo  *  Reality Capture program.                           *
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

:: run Reality Capture
%RealityCaptureExe% -set "appQuitOnError=true" -set "suppressErrors=true" -newScene -importGlobalSettings %Settings% -set "appCacheLocation=Custom" -set "appCacheCustomLocation=D:\Cache2" -quit

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