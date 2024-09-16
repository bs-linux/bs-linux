#!/bin/bash

# Update package lists
sudo apt update -q > /dev/null

# Count the number of available updates
updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

# Check if there are any updates available
if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi
