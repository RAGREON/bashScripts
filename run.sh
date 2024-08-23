#!/bin/bash

filename=$1

# Get the index from where the extension starts
extensionIndex=${filename%"."*}
extensionIndex=${#extensionIndex}

# Extract file extension from the file name
extension=${filename:extensionIndex+1}

# Extract file name without the extension 
filename=${filename:0:$extensionIndex}

# Compare the extension and run the appropriate command
case $extension in
    "c" | "cpp")
        if g++ $filename.$extension -o $filename.exe; then
            eval "./$filename.exe"
            eval "rm $filename.exe"
        else
            echo "compilation failed"
        fi
        ;;
    "py")
        eval "python $filename.$extension"
        ;;
    *)
        echo "syntax : run -<filename>"
esac
