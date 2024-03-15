@echo off
setlocal enabledelayedexpansion

rem Set the path to glslc.exe
set "GLSLC_PATH=C:\dev\manual\vulcan\Bin\glslc.exe"

rem Set the path to the current directory
set "CURRENT_DIR=%cd%"

rem Recursive function to search for .frag and .vert files
:searchFiles
for /r "%CURRENT_DIR%" %%F in (*.frag *.vert) do (
    rem Get the file extension
    set "EXTENSION=%%~xF"
    
    rem Set the output file name based on the extension
    if /i "!EXTENSION!"==".frag" (
        set "OUTPUT_EXTENSION=frag"
    ) else (
        set "OUTPUT_EXTENSION=vert"
    )

    rem Get the directory of the original file
    set "OUTPUT_DIR=%%~dpF"

    rem Run glslc.exe with the appropriate arguments
    "%GLSLC_PATH%" "%%F" -o "!OUTPUT_DIR!!OUTPUT_EXTENSION!.spv"
)

rem End of script
:end
