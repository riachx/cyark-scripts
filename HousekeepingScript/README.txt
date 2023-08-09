#################################################################
##                                                             ##
##              How to run the Housekeeping Script:            ##
##                                                             ##
#################################################################

BEFORE RUNNING:

    1. Your RealityCapture.exe should be installed at C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe
    
        If not, follow the prompts in the command prompt

    2. Keep the file Global_Settings_RC.rcconfig at the same location of the script. Do not rename any of the files.

    3. Close all instances of RealityCapture before proceeding. 

    4. CLICK CLOSE IF PROMPTED FOR RESTART!

TO BEGIN:

    1. Double click Housekeeping.bat

    2. Follow the prompts 
    
    3. Click close if RealityCapture prompts you for a restart.

    4. Once the script is finished, ensure your settings have changed. (e.g. your cache location should be at D:\Cache 
    or whatever path you specified).


#################################################################
##                      Troubleshooting:                       ##
#################################################################

1. If any of your paths are incorrect and you are certain that your project folder is organized correctly:

        Manually edit the paths in SetVariables.bat:

        - For the application file, change "C:\RealityCapture\RealityCapture.exe" to your desired path.


2. You did not save the Global_Settings_RC.rcconfig in the same location as this script. 

3. Open and close RealityCapture

4. If all else fails, import the global settings manually and specify your cache location.