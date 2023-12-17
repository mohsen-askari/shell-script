#!/bin/bash

# Directory to store files
output_dir="./save/"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Create a filename with the current date
output_file="$output_dir/data_$current_date.txt"

# Extract the first and third fields of /etc/passwd and save to the file
awk -F':'	'{print $1, $3}' /etc/passwd > "$output_file"

# Remove files older than two days
find "$output_dir" -name 'data_*' -type f -mtime +2 -exec rm {} \;

