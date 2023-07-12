::CapturingReality

:: switch off console output
@echo off

set /p "DRIVELETTER=Enter the drive of where your project folder is located (e.g., C,D,X): "
set /p "PROJECTNAME=Enter the project name (e.g., AMX_American_Embassy, QMP_Queen_Museum_Panorama_05_2022): "

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
REM change to C once finished testing
set RealityCaptureExe="D:\RealityCapture\RealityCapture.exe"
::set RealityCaptureExe="C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%

:: allows for users to have dates preceding "Applications" folder
set "keyword=Applications"
set "Applications=Applications"

for /d %%F in ("%DRIVELETTER%:\%PROJECTNAME%\*") do (
    echo checking %%~nxF
    echo %%~nxF | findstr /i %keyword% >nul
    if not errorlevel 1 (
        set "Applications=%%~nxF"
        goto endOfLoop
    )
)
:endOfLoop

:: root path to work folders where all the datasets are stored (%~dp0 means the flder in which this script is stored)
set RootFolder="%DRIVELETTER%:\%PROJECTNAME%\%Applications%\RealityCapture"
echo The path to your root folder is %RootFolder%

:: set path to the folder with your saved scene
set Project="%DRIVELETTER%:\%PROJECTNAME%\Applications\RealityCapture\Scene\%PROJECTNAME%_Scene.rcproj"
echo Your scene will be saved at %Project%

:: sets the path of the imported alignment settings (should be where script is saved)
set AlignmentSettings="%CD%\RC_Alignment_Low_Overlap.xml"
echo Your alignment settings are at %AlignmentSettings%