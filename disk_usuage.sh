
#!/bin/bash

# Check if a directory is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 [directory]>"
    exit 1
fi

directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory $directory not found!"
    exit 1
fi

# Report generation of disk usage
echo "Disk usage report for directory: $directory"
echo "-------------------------------------"

du -h "$directory" | sort -rh | head -n 10

exit 0
