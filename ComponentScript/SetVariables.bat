::CapturingReality

:: switch off console output
@echo off

set /p "DRIVELETTER=Enter the drive of where your project folder is located (e.g., C,D,X): "
set /p "PROJECTNAME=Enter the project name (e.g., AMX_American_Embassy, QMP_Queen_Museum_Panorama_05_2022): "

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe=D:\RealityCapture\RealityCapture.exe
echo The path to your application is %RealityCaptureExe%

:: root path to work folders where all the datasets are stored 
set RootFolder=%DRIVELETTER%:\%PROJECTNAME%
echo The path to your root folder is %RootFolder%

:: allows for users to have dates preceding/succeding "Applications" folder
set "keyword=Applications"
set "Applications=02_Applications"

for /d %%F in ("%RootFolder%\*") do (
    echo %%~nxF | findstr /i %keyword% >nul
    if not errorlevel 1 (
        set "Applications=%%~nxF"
        goto endOfLoop
    )
)
:endOfLoop

:: allows for users to have dates preceding/succeding "Master" folder
set "keyword=Master"
set "Master=03_Master"

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

:: set path to the folder that stores the components
set ComponentFolder=%RootFolder%\%Applications%\Reality_Capture\Components
echo The path to your exported components will be %ComponentFolder%
echo:

:: allows user to change application path if incorrect
set /p "PROGRAMPATHTRUE=Is your application path correct? (Y/N): "
    if /i "%PROGRAMPATHTRUE%" == "N" (
        set /p "RealityCaptureExe=Paste your application path: "
    )

echo:
echo Starting script...
echo: