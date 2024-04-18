#!/bin/bash

# ================================================================================
#
# SSH Menu Script
#
# Description: This script provides a menu-driven interface for connecting to SSH servers.
#
# Author: Mohsen Askari
# GitHub: https://github.com/mohsen-askari/shell-script
# Date: 2024-04-18
#
# Copyright (c) 2024 Mohsen Askari
#
# ================================================================================


ssh_list=(
"ssh1"
"ssh2"
"ssh3"
)

ssh_count=${#ssh_list[@]}

echo "Welcome to ssh list"

for ((i = 0; i < ssh_count; i++)); do
    echo "$((i+1)): ${ssh_list[i]}"
done


read -p "select SSH : " ssh_choice


if ((ssh_choice > 0 && ssh_choice <= ssh_count)); then

    selected_ssh="${ssh_list[ssh_choice-1]}"
    ssh -i /home/[USERNAME]/.ssh/id_rsa.pub $selected_ssh
    
else
    echo "Invalid choice. Please try again."
fi


# Instagram Link (Comment)
# Visit Mohsen Askari's Instagram profile: https://www.instagram.com/_mohsen_askari_


