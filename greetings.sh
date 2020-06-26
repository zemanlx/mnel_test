#!/bin/bash

# This script will greet everybody from the team personally

TEAM=(
    Alice
    Bob
    Eva
    Mallory
)

for member in "${TEAM[@]}"; do
    echo "Greetings to ${member}!"
done
