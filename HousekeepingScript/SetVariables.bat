::CapturingReality

:: switch off console output
@echo off

set /p "DRIVELETTER=Enter the drive of where your project folder is located (e.g., C,D,X): "
set /p "PROJECTNAME=Enter the project name (e.g., AMX_American_Embassy, QMP_Queen_Museum_Panorama_05_2022): "
set /p "SCENENAME=Enter a name for your Reality Capture scene (e.g., AMX_American_Embassy_Scene): "

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
REM change to C once finished testing
set RealityCaptureExe=C:\RealityCapture\RealityCapture.exe
echo The path to your application is %RealityCaptureExe%

:: root path to work folders where all the datasets are stored (%~dp0 means the flder in which this script is stored)
set RootFolder=%DRIVELETTER%:\%PROJECTNAME%\Applications\RealityCapture
echo The path to your root folder is %RootFolder%

:: set path to the folder with your saved scene
set Project=%RootFolder%\Scene\%SCENENAME%
echo Your scene will be saved at %Project%

:: sets the path of the imported alignment settings (should be where script is saved)
set AlignmentSettings=%CD%\RC_Alignment_Low_Overlap.xml
echo Your alignment settings are at %AlignmentSettings%