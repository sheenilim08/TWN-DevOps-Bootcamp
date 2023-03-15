#!/bin/bash

echo "Show all process for $USER"

while true;
read -p "1 - Sort by CPU, 2 - Sort by Memory: " choice
read -p "Processes to show: " proc_count
do
    if [[ $choice == 1 ]];then
        ps aux --sort=+%cpu | grep $USER | head -n $proc_count
        
        echo ""
        echo "Exiting."
        break
    elif [[ $choice == 2 ]]; then
        ps aux --sort=+%mem | grep $USER | head -n $proc_count

        echo ""
        echo "Exiting."
        break
    else
        echo "Unknown option selected."
    fi
done
