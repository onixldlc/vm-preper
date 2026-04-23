#!/bin/bash

# install-all.sh — unattended full install with Docker
# Installs: all language tools, Docker, network tools, and all misc tools.
# For a custom selection use install-preset.sh instead.

REPO_RAW="https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main"

if [ ! -f /etc/lsb-release ]; then
    echo "Currently this script is only intended to run on Ubuntu environment."
    exit 1
fi

echo "Running on Ubuntu environment. (install-all setup)"
echo "starting the installer..."

export INSTALL_DEPS=Y
export INSTALL_LANGS=1,2,3,4        # go, node, python, rust
export INSTALL_CONTAINERS=1         # docker only
export INSTALL_NETWORKS=1,2,3,4,6,8,10,11  # dnsutils, iproute2, ping, traceroute, mtr, tcpdump, net-tools, telnet
export INSTALL_MISC=1,2,4,5,6,7    # btop, bottom, lazydocker, neofetch, rsync, neovim
export CLEAR_HISTORY=N
export BTOP_ROOT_THEME=Y
export NVCHAD=Y
export NVCHAD_ROOT=Y

bash <(curl -sSf "$REPO_RAW/script/setup/ubuntu/install-tools.sh")