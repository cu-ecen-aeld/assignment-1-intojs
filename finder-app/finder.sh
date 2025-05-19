#!/bin/bash

files_dir="$1"
search_str="$2"

if [ -z "$files_dir" ]; then
    echo "files_dir is missing" 
    exit 1
fi

if [ -z "$search_str" ]; then
    echo "search_str is missing" 
    exit 1
fi

if [ ! -d "$files_dir" ]; then
    echo "files_dir does not represent a directory on the filesystem"
    exit 1
fi

# Count all regular files (recursively)
file_count=$(find "$files_dir" -type f | wc -l)

# Count matching lines
match_count=$(grep -r "$search_str" "$files_dir" 2>/dev/null | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"
