#!/bin/bash

# Check if the file containing IPs is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <IPs_file>"
    exit 1
fi

# File containing IPs
ip_file="$1"

# Check if the file exists
if [ ! -f "$ip_file" ]; then
    echo "Error: File '$ip_file' not found."
    exit 1
fi

# Create a log directory if it doesn't exist
log_dir="ping_logs"
mkdir -p "$log_dir"

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Loop through each IP in the file
while IFS= read -r ip; do
    # Get the hostname
    hostname=$(host "$ip" | awk '{print $NF}')
    
    # Perform ping and save the result to the log file
    ping_result=$(ping -c 4 "$ip")
    echo -e "Ping result for $ip ($hostname) on $current_date:\n$ping_result\n\n" >> "$log_dir/$current_date"_"$hostname"_ping.log
done < "$ip_file"

echo "Ping results saved in '$log_dir' directory."

