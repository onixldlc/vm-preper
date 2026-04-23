#!/bin/bash

# install-all.sh — unattended full dev install with Docker.
# For a custom selection: bash <(curl -sSf "$REPO_RAW/install-preset.sh") config/my-preset.env

REPO_RAW="https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main"

if [ ! -f /etc/lsb-release ]; then
    echo "Currently this script is only intended to run on Ubuntu environment."
    exit 1
fi

echo "Running on Ubuntu environment. (install-all setup)"

# These override anything in the preset file — install-preset.sh handles name->ID resolution.
export INSTALL_DEPS=Y
export INSTALL_LANGS=go,node,python,rust
export INSTALL_CONTAINERS=docker
export INSTALL_NETWORKS=nslookup,ip,ping,traceroute,mtr,tcpdump,net-tools,telnet
export INSTALL_MISC=btop,bottom,lazydocker,neofetch,rsync,neovim
export CLEAR_HISTORY=Y
export BTOP_ROOT_THEME=Y
export NVCHAD=Y
export NVCHAD_ROOT=Y

bash <(curl -sSf "$REPO_RAW/install-preset.sh")
