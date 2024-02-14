# Script to count number of files in a directory
# Run the script by adding execute permission
# add directory name while executing the script i.e. ./count_files.sh [dir_name]
#!/bin/bash

# Ensure a directory is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "$directory is not a directory"
    exit 1
fi

# Count the number of files in the directory and display the count
file_count=$(find "$directory" -maxdepth 1 -type f | wc -l)
echo "Number of files in $directory: $file_count"
