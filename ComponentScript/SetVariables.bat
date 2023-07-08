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
set RootFolder=%DRIVELETTER%:\%PROJECTNAME%\Applications\RealityCapture
echo The path to your root folder is %RootFolder%

:: set path to the folder with your images
set Images=%RootFolder%\Master\Photogrammetry
echo The path to your images is %Images%

set ComponentFolder=%RootFolder%\Components
echo The path to your exported components will be %ComponentFolder%

:: sets the path of the imported alignment settings
set AlignmentSettings="%RootFolder%\RC_Alignment_Low_Overlap.xml"

:: sets path of where housekeeping script saved file
set Project=%RootFolder%\Scene\%SCENENAME%

:: sets the path of where we want to save the components
set ComponentPath="%RootFolder%\Components"
echo: