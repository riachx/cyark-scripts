::CapturingReality

:: switch off console output
@echo off

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe="D:\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%

:: sets the path of the imported settings (should be where script is saved)
set Settings="%CD%\RC_Global_Settings.rcconfig"
echo Your global settings are at %Settings%
echo: