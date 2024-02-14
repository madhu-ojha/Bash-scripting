#!/bin/bash
# Find and replace text in all .txt files in the current directory
# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 search_text replace_text"
    exit 1
fi

search_text=$1
replace_text=$2

# Loop for files in the current directory
for file in *.txt; do
    if [ -f "$file" ]; then
        sed -i "s/$search_text/$replace_text/g" "$file"
        echo "Replaced '$search_text' with '$replace_text' in $file"
    fi
done
