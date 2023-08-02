::CapturingReality

:: switch off console output
@echo off
setlocal ENABLEDELAYEDEXPANSION

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe="C:\ProgramFiles\CapturingReality\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%

:: sets the path of the imported settings (should be where script is saved)
set Settings="%CD%\RC_Global_Settings.rcconfig"
echo The path to your global settings is %Settings%
echo:

:: allows user to change application path if incorrect
set /p "PROGRAMPATHTRUE=Is your application path correct? (Y/N): "
if /i "%PROGRAMPATHTRUE%" == "N" (
    set /p "RealityCaptureExe=Paste your application path: "
    echo:
    echo The path to your application is now !RealityCaptureExe!
)

set /p "START=Would you like to start? (y/n)"
echo:

if /i "%START%" == "N"(
    exit
)