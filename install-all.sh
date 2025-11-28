#!/bin/bash

# check if the script is running on ubuntu environment
if [ -f /etc/lsb-release ]; then
    echo "Running on Ubuntu environment. (install-all setup)"
    echo "starting the installer..."
    
    # but skip the networking stuff as it can disconnect you from the server
    INPUTS="$(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/config/install-all.txt")"
    bash <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-tools.sh")  <<< "${INPUTS}"

    # now install the networking tools
    NETWORKS="$(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/config/install-networks.txt")"
    bash <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-network-tools.sh") <<< "${NETWORKS}"

else
    echo "Currently this script is only intended to run on Ubuntu environment."
    exit 1
fi