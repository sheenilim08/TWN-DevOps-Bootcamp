#!/bin/bash

read -p "Please enter your name: " name

if [ "$name" == "Sheen Ismhael Lim" ]; then
    echo "Hello $name, you are the one!"
elif [ "$name" == "Kimchi" ]; then
    echo "Hello $name, you are the favorite dog!"
else
    echo "Hello $name"
fi