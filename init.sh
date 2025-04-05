#!/bin/bash

# check if the script is running on ubuntu environment
if [ -f /etc/lsb-release ]; then
    echo "Running on Ubuntu environment."
    echo "starting the installer..."
    curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-tools.sh" | bash 
else
    echo "Currently this script is only intended to run on Ubuntu environment."
    exit 1
fi