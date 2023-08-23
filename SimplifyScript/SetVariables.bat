::Simplify Script
:: switch off console output
@echo off

echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe=C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe
echo The path to your application is %RealityCaptureExe%
echo:

:: allows user to change application path if incorrect
set /p "PROGRAMPATHTRUE=Is your application path correct? (Y/N): "
    if /i "%PROGRAMPATHTRUE%" == "N" (
        set /p "RealityCaptureExe=Paste your application path: "
        echo:
    )
echo:

::set /p SIZE=Is your model in the billions, millions or thousands? (B,M, or T):
::if /i "%SIZE%" == "B" (

:: Ask the user for the triangle count
set /p TRICOUNT=Enter the approximate triangle count of the model (No commas): 
echo:
echo Your model will be simplified down to approximately 30M triangles.

REM Step 2: Call the PowerShell script and pass the number
powershell -ExecutionPolicy Bypass -File "divide.ps1" %TRICOUNT%

< output.txt (
    set /p "timesToDivide="
)


set Settings="%CD%\SimplifySettings.xml"
pause