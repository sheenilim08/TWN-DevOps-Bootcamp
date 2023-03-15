#!/bin/bash

sum=0
while true
do
    echo "Total sum: $sum"
    read -p "Please enter number: " number

    if [ "$number" == "q" ] || [ "$number" == "Q" ]; then
        break
    fi

    sum=$(($sum+$number))
done