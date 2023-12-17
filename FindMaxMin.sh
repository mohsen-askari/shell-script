#!/bin/bash

# Function to find the maximum and minimum
find_max_min() {
    MAX=${numbers[0]}
    MIN=${numbers[0]}

    for NUM in "${NUMBERS[@]}"; do
        if ((NUM > MAX))
       	then
            MAX=$NUM
        fi

        if ((NUM < MIN))
       	then
            MIN=$NUM
        fi
    done

    echo "max=$MAX, min=$MIN"
}



# Array to store the numbers
declare -a NUMBERS

# Input 20 NUMBERS
echo "Enter 20 numbers:"
for ((i = 1; i <= 20; i++)); do
    read -p "Enter number $i: " NUM
    NUMBERS+=("$NUM")
done

# Find the maximum and minimum

find_max_min

# Display the results
echo "The largest number is: $MAX"
echo "The smallest number is: $MIN"

