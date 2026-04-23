#!/bin/bash

### setup new linux
# install dependencies
IFS_YES="${INSTALL_DEPS:-}"
if [ -z "$IFS_YES" ]; then
    read -p "install dependencies (Y/n): " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing dependencies..."
    sudo apt update && sudo apt install -y \
        git curl \
        wget vim jq \
        unzip cmake \
        gcc
else
    echo "stopping bootstrap..."
    #exit 0
fi

if [[ -z "${INSTALL_LANGS:-}" ]]; then
    read -p "do you want to install programing tools? (Y/n) " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
elif [[ "${INSTALL_LANGS}" =~ ^[Nn] ]]; then
    IFS_YES="N"
else
    IFS_YES="Y"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing programing tools..."
    source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-language-tools.sh") 
else
    echo "skipping programing tools..."
fi

if [[ -z "${INSTALL_CONTAINERS:-}" ]]; then
    read -p "do you want to install containerization tools? (Y/n) " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
elif [[ "${INSTALL_CONTAINERS}" =~ ^[Nn] ]]; then
    IFS_YES="N"
else
    IFS_YES="Y"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing containerization tools..."
    source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-container-tools.sh") 
else
    echo "skipping containerization tools..."
fi

if [[ -z "${INSTALL_NETWORKS:-}" ]]; then
    read -p "do you want to install networking tools? (Y/n) " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
elif [[ "${INSTALL_NETWORKS}" =~ ^[Nn] ]]; then
    IFS_YES="N"
else
    IFS_YES="Y"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing networking tools..."
    source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-network-tools.sh") 
else
    echo "skipping networking tools..."
fi

if [[ -z "${INSTALL_MISC:-}" ]]; then
    read -p "do you want to install misc tools? (Y/n) " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
elif [[ "${INSTALL_MISC}" =~ ^[Nn] ]]; then
    IFS_YES="N"
else
    IFS_YES="Y"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "installing misc tools..."
    source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-misc-tools.sh") 
else
    echo "skipping misc tools..."
fi

IFS_YES="${CLEAR_HISTORY:-}"
if [ -z "$IFS_YES" ]; then
    read -p "do you want to clear command history? (N/y) " IFS_YES
    IFS_YES="${IFS_YES:-N}"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "clearing history..."
    history -c && history -w 
else
    echo "skipping clear history..."
fi
