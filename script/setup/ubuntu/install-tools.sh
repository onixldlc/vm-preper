#!/bin/bash

### setup new linux
# install dependencies
read -p "install dependencies (Y/n): " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing dependencies..."
    sudo apt install -y \
        git curl \
        wget vim jq \
        unzip neovim \
        cmake gcc
else
    echo "stopping bootstrap..."
    exit 0
fi

read -p "do you want to install programing tools? (Y/n) " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing programing tools..."
    curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-language-tools.sh" | bash 
else
    echo "skipping programing tools..."
fi

read -p "do you want to install containerization tools? (Y/n) " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing containerization tools..."
    curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-container-tools.sh" | bash 
else
    echo "skipping containerization tools..."
fi

read -p "do you want to install networking tools? (Y/n) " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing networking tools..."
    curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-network-tools.sh" | bash 
else
    echo "skipping networking tools..."
fi

read -p "do you want to install misc tools? (Y/n) " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing misc tools..."
    curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-misc-tools.sh" | bash 
else
    echo "skipping misc tools..."
fi
