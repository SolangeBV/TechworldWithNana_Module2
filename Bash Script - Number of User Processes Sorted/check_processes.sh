#!/bin/bash

current_user="$USER"

echo "Enter 'm' to sort by memory consumption or 'c' to sort by CPU consumption:"
read -r choice

while true; do
    echo "Enter the number of processes to display:"
    read -r process_count

    if [[ "$process_count" =~ ^[0-9]+$ ]]; then
        break  # Exit the loop if a valid number is entered
    else
        echo "Invalid input"
    fi
done

echo "Processes for user: $current_user"

if [ "$choice" = "m" ]; then
    ps aux | grep "^$current_user" | sort -nrk 4 | head -n "$process_count"
elif [ "$choice" = "c" ]; then
    ps aux | grep "^$current_user" | sort -nrk 3 | head -n "$process_count"
else
    echo "Invalid choice. Please enter 'm' or 'c'."
fi
