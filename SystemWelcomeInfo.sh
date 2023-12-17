#!/bin/bash

# Display a welcome message to the logged-in user
echo "Welcome, $USER!"

# Show today's date to the user
current_date=$(date +"%A, %B %d, %Y")
echo "Today's date is: $current_date"

# Display the number of users currently logged into the system
logged_in_users=$(who | wc -l)
echo "Number of users logged in: $logged_in_users"

