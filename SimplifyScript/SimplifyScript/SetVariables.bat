::Simplify Script
@echo off

echo **Ensure your RC project is open.**
echo:
echo Ensure the following paths are correct:
echo:

:: path to RealityCapture application
set RealityCaptureExe="C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe"
echo The path to your application is %RealityCaptureExe%
echo:

:: allows user to change application path, if incorrect
set /p "ProgramPathTrue=Is your application path correct? (Y/N): "
    if /i "%ProgramPathTrue%" == "N" (
        set /p "RealityCaptureExe=Paste your application path in double quotes: "
        echo:
    )
echo:

:: Ask the user for the triangle count
set /p TriCount=Enter the approximate triangle count of the model (No commas): 
echo:
echo Your model will be simplified down to approximately 30M triangles.

:: If you want to simplify to a different number, change this.
:: stores the optimal triangle count. 
set "FinalSimplify=30000000"

:: Call the PowerShell script and pass the triangle count and optimal triangle count
powershell -ExecutionPolicy Bypass -File "divide.ps1" %TriCount% %FinalSimplify%
:: push the number of times to divide to a temporary text file
< output.txt (
    set /p "timesToDivide="
)

:: stores the simplification settings that simplify by 1/2 each time
set DivideByHalfSettings="%CD%\SimplifySettings.xml"