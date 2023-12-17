#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <IP_Address> <Username> <Password>"
    exit 1
fi

# Assign command-line arguments to variables
ip_address=$1
username=$2
password=$3

# Function to check if the server is pingable
check_ping() {
    ping -c 1 "$ip_address" > /dev/null
}

# Function to transfer /etc/passwd to the remote server
transfer_passwd() {
    scp /etc/passwd "$username@$ip_address:/home/$username/"
}

# Check if the server is pingable
if check_ping; then
    echo "Server is pingable."

    # Transfer /etc/passwd to the remote server
    transfer_passwd

    echo "/etc/passwd file transferred to /home/$username on the server."
else
    echo "Server is not accessible."
fi

