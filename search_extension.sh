# Script to search for files with the specified extension in the directory and its subdirectories
# Usuage: ./search_extension.sh [directory_name]
#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <file_extension>"
    exit 1
fi

directory="$1"
file_extension="$2"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found."
    exit 1
fi

# Search for files with the specified extension in the directory and its subdirectories
echo "Searching for .$file_extension files in $directory..."
find "$directory" -type f -name "*.$file_extension"
