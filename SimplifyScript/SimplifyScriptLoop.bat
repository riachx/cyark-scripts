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
echo.  *  Please read the README.txt file before proceeding! *
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

set /p "timesDivided=" < output.txt

if /i $timesDivided$ == "0" do (
    %RealityCaptureExe% -delegateTo * ^
    -selectComponent "Master" ^
    -selectModel "Ultra" ^
    -simplify "30000000"
    -selectComponent "Master" ^
    -selectModel "Model 1" ^
    -renameSelectedModel "Recap"
)

if /i $timesDivided$ == "1" do (
    %RealityCaptureExe% -delegateTo * ^
    -selectComponent "Master" ^
    -selectModel "Ultra" ^
    -simplify "%SETTINGS%" ^
    -cleanModel ^
    -simplify "30000000"
    -cleanModel ^
    -selectComponent "Master" ^
    -selectModel "Model 1" ^
    -renameSelectedModel "Recap"
)

for /L %%i in (1,1,%timesDivided%) do (
    echo Division # %%i
    if %%i equ 1 (
        echo This is the first iteration: %%i
        :: if we need to not clean on first iteration
        if %TRICOUNT% gtr 800000000(
           %RealityCaptureExe% -delegateTo * ^
            -selectComponent "Master" ^
            -selectModel "Ultra" ^
            -simplify %SETTINGS% ^  
       )
       :: if we need to clean on first iteration
       else (
           %RealityCaptureExe% -delegateTo * ^
            -selectComponent "Master" ^
            -selectModel "Ultra" ^
            -simplify %SETTINGS% ^ 
           -cleanModel ^ 
       )
        
    ) else (
        :: IF last loop is starting and we are finished ... 
       if %%i == %timesDivided% (
           
        %RealityCaptureExe% -delegateTo * ^
        -selectComponent "Master" ^
        -selectModel "Ultra" ^
        -simplify "30000000" ^
        -cleanModel ^
        -selectModel "Ultra" ^
        -renameSelectedModel "Recap"
       )
       :: if we need to clean the model after
       else if %TRICOUNT% gtr 800000000(
           %RealityCaptureExe% -delegateTo * ^
           -simplify %SETTINGS% ^ 
           -cleanModel ^ 
       )
       :: if we don't need to clean the model 
       else (
           %RealityCaptureExe% -delegateTo * ^
           -simplify %SETTINGS% ^
       )
    )
)

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