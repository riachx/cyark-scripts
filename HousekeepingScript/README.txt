#################################################################
##                                                             ##
##              How to run the Housekeeping Script:            ##
##                                                             ##
#################################################################

BEFORE RUNNING:

    1. Your RealityCapture.exe should be installed at C:\RealityCapture\RealityCapture.exe
    
        If not, edit the line:
        "set RealityCaptureExe=C:\RealityCapture\RealityCapture.exe" in SetVariables.bat to
        "set RealityCaptureExe=YourPathHere\RealityCapture.exe"

    2. Keep the file RC_Global_Settings.rcconfig at the same location of the script. Do not rename any of the files.

TO BEGIN:

    1. Double click Housekeeping.bat

    2. There are no prompts for this script.

    3. Once the script is finished, ensure your settings have changed. (eg. your cache location should be at D:Cache now).


#################################################################
##                      Troubleshooting:                       ##
#################################################################

1. If any of your paths are incorrect and you are certain that your project folder is organized correctly:

        Manually edit the paths in SetVariables.bat:

        - For the application file, change "C:\RealityCapture\RealityCapture.exe" to your desired path.


2. You did not save the RC_Global_Settings.rcconfig in the same location as this script. 

3. Your D drive is missing or corrupted. The D drive is necessary to define a cache location.

4. If all else fails, import the global settings manually.