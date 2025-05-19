#!/bin/bash

writefile="$1"
writestr="$2"

# Check if arguments are provided
if [ -z "$writefile" ]; then
    echo "writefile argument is missing"
    exit 1
fi

if [ -z "$writestr" ]; then
    echo "writestr argument is missing"
    exit 1
fi

# Extract the directory path from the full file path
dir_path=$(dirname "$writefile")

# Create directory path if it doesn't exist
if ! mkdir -p "$dir_path"; then
    echo "Failed to create directory path: $dir_path"
    exit 1
fi

# Write the string to the file (overwrite if exists)
if ! echo "$writestr" > "$writefile"; then
    echo "Failed to write to file: $writefile"
    exit 1
fi