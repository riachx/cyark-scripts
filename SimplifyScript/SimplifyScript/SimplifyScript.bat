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
echo  *  Please read the README.txt file before proceeding! *
echo  *  This script will simplify and clean your model     *
echo  *  down to 30M triangles, in an open project.         *
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

::remember to set consistent variables, fix readme

:: sets necessary paths
call SetVariables.bat

:: store the number of times to divide written in "divide.ps1" in a variable
set /p "TimesDivided=" < output.txt

:: if we don't need to halve the model, simplify to 30M and clean
if /i "%TimesDivided%" == "0" (
    %RealityCaptureExe% -delegateTo * ^
    -selectComponent "Master" ^
    -selectModel "Ultra" ^
    -simplify "%FinalSimplify%" ^
    -cleanModel ^
    -selectComponent "Master" ^
    -selectModel "Model 2" ^
    -renameSelectedModel "Recap"
    goto JumpToPoint
)

:: if we only need to halve model once, simplify, clean, simplify and clean.
if /i "%TimesDivided%" == "1" (
    %RealityCaptureExe% -delegateTo * ^
    -selectComponent "Master" ^
    -selectModel "Ultra" ^
    -simplify "%DivideByHalfSettings%" ^
    -cleanModel ^
    -simplify "%FinalSimplify%" ^
    -cleanModel ^
    -selectComponent "Master" ^
    -selectModel "Model 4" ^
    -renameSelectedModel "Recap"
    goto JumpToPoint
)

setlocal enabledelayedexpansion
:: for larger triangle count cases . . . 
:: simplifies each prior model by a half
for /L %%i in (1,1,%TimesDivided%) do (
    if %%i equ 1 (
        %RealityCaptureExe% -delegateTo * ^
        -selectComponent "Master" ^
        -selectModel "Ultra" ^
        -simplify %DivideByHalfSettings% 
    
    ) else (
        set /A "ModelNum=%%i-1"
        %RealityCaptureExe% -delegateTo * ^
        -selectComponent "Master" ^
        -selectModel "Model !ModelNum!" ^
        -simplify %DivideByHalfSettings% 
    )
)
endlocal
:: stores the number of times to divide plus one so we can select the last model to rename. 
set /A "TimesDividedPlusTwo=%TimesDivided%+2" 

:: simplify and clean the model for the final "Recap" model
%RealityCaptureExe% -delegateTo * ^
    -selectComponent "Master" ^
    -selectModel "Model %TimesDivided%" ^
    -simplify "%FinalSimplify%" ^
    -cleanModel ^
    -selectModel "Model %TimesDividedPlusTwo%" ^
    -renameSelectedModel "Recap"

:: jump to this if we only divided zero or one times. 
:JumpToPoint

echo:
echo Simplifying in process . . .
echo:

:: waits until all processes finish until printing ending message
%RealityCaptureExe% -waitCompleted *

:: deletes the excess txt file
del output.txt

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