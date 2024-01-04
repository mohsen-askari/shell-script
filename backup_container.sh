#!/bin/bash

# Set the backup directory
backup_dir="/home/mohsen/backup_containers/backup_$(date '+%Y%m%d%H%M%S')"
mkdir -p "$backup_dir"



remote_server_ip="127.0.0.1"           # Replace with your remote server ip
remote_server_user="your_remote_user"  # Replace with your remote server username
remote_server_backup_dir="/home/"


# Set the threshold size for gzip compression
threshold_size_mb=40

# Get a list of running Docker containers
containers=$(docker ps -q)

# Backup each container
for container_id in $containers; do
    container_name=$(docker inspect --format='{{.Name}}' "$container_id" | cut -c2-)
    backup_file="$backup_dir/$container_name.tar"

    container_image=$(docker inspect -f '{{.Image}}' $container_id)
    # Save the container image
    # docker save "$container_id" -o "$backup_file"
    docker save  $container_image -o $backup_file

    # Check the file size
    file_size=$(du -m "$backup_file" | cut -f1)
    
    if [ "$file_size" -gt "$threshold_size_mb" ]; then
        # If file size is greater than the threshold, gzip the file
        gzip "$backup_file"
    fi
done

echo "Backup completed successfully at $(date '+%Y-%m-%d %H:%M:%S')"


# Copy the backup directory to the remote server
scp -r "$backup_dir" "$remote_server_user"@"$remote_server_ip":"$remote_server_backup_dir"


# To schedule this script to run daily at 02:30, you can add the following line to your crontab:
# 30 2 * * * /home/mohsen/Desktop/learn/DevOps/DevOps-07/Practice/backup_container.sh
