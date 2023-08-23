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
echo  *                   Simplify Script                   *
echo  *                                                     *
echo. *  Please read the README.txt file before proceeding! *
echo  *  This script will simplify and clean your model     *
echo  *  in an open project.                                *
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

:: an idea would be to create multiple if statements that run which poly count matches?
:: we might be able to directly do TRICOUNT / 2 ...
%RealityCaptureExe% -delegateTo * ^
-selectComponent "Master" ^
-selectModel "Ultra" ^
-simplify %Settings% ^ 
-simplify %Settings% ^ 
-simplify %Settings% ^ 
-cleanModel ^ 
-simplify %Settings% ^ 
-cleanModel^ 
-simplify %Settings% ^ 
-cleanModel ^ 
-simplify %Settings% ^
-cleanModel ^
-simplify %Settings% ^
-selectModel "Ultra" ^
-renameSelectedModel "Recap"

:: ending message
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