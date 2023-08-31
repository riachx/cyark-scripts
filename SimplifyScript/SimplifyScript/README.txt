#################################################################
##                                                             ##
##              How to run the Simplify Script:                ##
##                                                             ##
##   Simplifies a model down to 30 million triangles in 50%    ##
##   decrements. Cleans at the very end. Intended for very     ##
##                      large models.                          ##
##                                                             ##
#################################################################


BEFORE RUNNING:

    1. Your RealityCapture.exe should be installed at "C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe"
        If not, follow the prompts in the terminal.

    2. Your project should be already opened. There should not be multiple instances of RC open.

    3. Your project must have a component named "Master" with the model you want simplified named "Ultra".

    4. Your component "Master" should not have any models named "Model 1", "Model 2", "Model 3", etc. 

    5. If you quit this program early, note that the file output.txt is a temporary file and can be deleted.

TO BEGIN:

    1. Double click SimplifyScript.bat

    2. Follow the 2 prompts requested in the command prompt.

    3. Ensure your RealityCapture path is correct.

    4. Once the script is finished, ensure you have a model named "Recap" 


#################################################################
##                      Troubleshooting:                       ##
#################################################################

1. If any of your paths are incorrect:

        Follow the prompts. 

        Manually edit the paths in SetVariables.bat:

        - For the application file, change "C:\Program Files\Capturing Reality\RealityCapture\RealityCapture.exe" to your desired path.

2. Your Reality Capture program may be in the wrong location or you did not input the path correctly. Refer to #1 to change the path.

3. Ensure that you did not rename any of the scripts/files or move any of them around.

4. Ensure only one RC instance is open and already saved.

5. Ensure you inputted a triangle count over 30 million. If you want to simplify to a different amount, simply change the variable "FinalSimplify".

6. You must have PowerShell installed. All modern Windows computers have this.

7. Ensure the component "Master" does not have any models named "Model 1", "Model 2", "Model 3", etc. 