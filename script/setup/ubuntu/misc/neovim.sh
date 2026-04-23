#!/bin/bash

# install neovim
sudo apt-get install neovim -y

# setup neovim configs (if they want)
IFS_YES="${NVCHAD:-}"
if [ -z "$IFS_YES" ]; then
    read -p "install nvchad? (Y/n) " IFS_YES
    IFS_YES="${IFS_YES:-Y}"
fi
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "adding nvchad..."
    git clone https://github.com/onixldlc/nvim-config.git $HOME/.config/nvim

    IFS_YES2="${NVCHAD_ROOT:-}"
    if [[ $EUID -eq 0 ]]; then
        echo "running as root, skipping root nvchad symlink (already installed above)..."
    else
        if [ -z "$IFS_YES2" ]; then
            read -p "install nvchad to root? (Y/n) " IFS_YES2
            IFS_YES2="${IFS_YES2:-Y}"
        fi
        if [[ $IFS_YES2 =~ ^[Yy]$ ]]; then
            echo "adding nvchad to root..."
            sudo mkdir -p /root/.config
            sudo rm -rf /root/.config/nvim
            sudo ln -s $HOME/.config/nvim /root/.config/nvim
        else
            echo "skipping nvchad for root..."
        fi
    fi

else
    echo "skipping nvchad..."
fi
