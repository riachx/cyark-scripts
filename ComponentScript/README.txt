#################################################################
##                                                             ##
##              How to run the Components Script:              ##
##                                                             ##
#################################################################

BEFORE RUNNING:

    1. Your RealityCapture.exe should be installed at C:\RealityCapture\RealityCapture.exe
    
        If not, edit the line:
        "set RealityCaptureExe=C:\RealityCapture\RealityCapture.exe" in SetVariables.bat to
        "set RealityCaptureExe=YourPathHere\RealityCapture.exe"

    2. Ensure all of your folders are organized correctly. Note that this script will automatically create folders (Applications\RealityCapture\Components) if you have not created them prior.

    3. Please run the Housekeeping script prior, to ensure settings are set properly.

    4. Your folder Master\Photogrammetry must exist already with image folders inside. The folder name of Master and Applications is allowed to include dates or excess characters in front or at the end of the filename.


TO BEGIN:

    1. Double click createComponents.bat

    2. Follow all of the prompts requested in the command prompt. Do not include any excess spaces.

    3. Ensure all paths requested are correct.

    4. Once the script is finished, ensure the components are exported at "ProjectName\Applications\RealityCapture\Components".


#################################################################
##                      Troubleshooting:                       ##
#################################################################

1. If any of your paths are incorrect and you are certain that your project folder is organized correctly:

        Manually edit the paths in SetVariables.bat:

        - For the application file, change "C:\RealityCapture\RealityCapture.exe" to your desired path.

        - For the Root Folder path, change "%DRIVELETTER%:\%PROJECTNAME%" to your desired path.

        - For the images path, change "%RootFolder%\%Master%\Photogrammetry" to your desired path.

2. Your Reality Capture program may be in the wrong location. Refer to #1 to change the path.

3. Ensure that you did not rename any of the scripts or files.

4. Make sure you followed prompts in the command prompt correctly.
