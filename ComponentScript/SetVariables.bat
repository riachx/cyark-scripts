::CapturingReality

:: switch off console output
@echo off

set /p "DRIVELETTER=Enter the drive of where your project folder is located (e.g., C,D,X): "
set /p "PROJECTNAME=Enter the three letters preceding your project name (e.g., AMX_American_Embassy will be AMX): "

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
::set RealityCaptureExe=D:\RealityCapture\RealityCapture.exe
set RealityCaptureExe="C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%

set "drive=%DRIVELETTER%:"
set "project_found=false"
setlocal enabledelayedexpansion
for /d %%i in ("%drive%\*") do (
    set "folder_name=%%~nxi"
    if "!folder_name:~0,3!" equ "%PROJECTNAME%" (
        set "PROJECTNAME=%%i"
        set "project_found=true"
    )
)

if "!project_found!" == "false" (
    echo:
    echo **********************************************************************************************
    echo:
    echo  ERROR: Project not found!                                                                  
    echo  Ensure you are typing the first three letters of the project name. Capitalization matters.
    echo:
    echo **********************************************************************************************
    echo:
    echo Quitting . . .
    pause
) 

:: root path to work folders where all the datasets are stored 
set RootFolder=!PROJECTNAME!
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
> tmp_paths.txt (
    echo(%Images%
    echo(%ComponentFolder%
)

:: allows user to change application path if incorrect
set /p "PROGRAMPATHTRUE=Is your application path correct? (Y/N): "
    if /i "%PROGRAMPATHTRUE%" == "N" (
        set /p "RealityCaptureExe=Paste your application path in double quotes: "
    )

echo:
set /p "START=Would you like to start? (Y/N): "
    if /i "%START%" == "N" (
        echo Quitting program...
        exit \b 0
    )

endlocal

echo:
echo Starting script...
echo: