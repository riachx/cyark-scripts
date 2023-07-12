::CapturingReality

:: switch off console output
@echo off

set /p "DRIVELETTER=Enter the drive of where your project folder is located (e.g., C,D,X): "
set /p "PROJECTNAME=Enter the project name (e.g., AMX_American_Embassy, QMP_Queen_Museum_Panorama_05_2022): "

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
REM change to C once finished
set RealityCaptureExe=D:\RealityCapture\RealityCapture.exe
echo The path to your application is %RealityCaptureExe%

:: root path to work folders where all the datasets are stored (%~dp0 means the flder in which this script is stored)
set RootFolder=%DRIVELETTER%:\%PROJECTNAME%
echo The path to your root folder is %RootFolder%

:: allows for users to have dates preceding "Applications" folder
set "keyword=Applications"
set "Applications=Applications"

for /d %%F in ("%RootFolder%\*") do (
    echo %%~nxF | findstr /i %keyword% >nul
    if not errorlevel 1 (
        set "Applications=%%~nxF"
        goto endOfLoop
    )
)
:endOfLoop

:: allows for users to have dates preceding "Master" folder
set "keyword=Master"
set "Master=Master"

for /d %%F in ("%RootFolder%\*") do (
    echo %%~nxF | findstr /i %keyword% >nul
    if not errorlevel 1 (
        set "Master=%%~nxF"
        goto endOfLoop
    )
)
:endOfLoop

:: set path to the folder with your images
set Images=%RootFolder%\%Master%\Photogrammetry
echo The path to your images is %Images%

set ComponentFolder=%RootFolder%\%Applications%\RealityCapture\Components
echo The path to your exported components will be %ComponentFolder%

echo: