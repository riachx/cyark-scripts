::CapturingReality

:: switch off console output
@echo off

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe="C:\Program Files\Capturing Reality\RealityCapture\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%

:: sets the path of the imported settings (should be where script is saved)
set Settings="%CD%\RC_Global_Settings.rcconfig"
echo The path to your global settings is %Settings%
echo:

:: allows user to change application path if incorrect
set /p "PROGRAMPATHTRUE=Is your application path correct? (Y/N): "
    if /i "%PROGRAMPATHTRUE%" == "N" (
        set /p "RealityCaptureExe=Paste your application path: "
    )

:: allows user to change application path if incorrect
set /p "USERCACHE=Do you want to set a cache location? Default is D:\Cache. (Y/N): "
    if /i "%USERCACHE%" == "Y" (
        set /p "USERCACHEPATH=Paste the path of your cache folder: "
    )

echo:
set /p "START=Would you like to start? (Y/N): "
    if /i "%START%" == "N" (
        echo Quitting program...
        exit \b 0
    )

echo:
echo Starting script...
echo: