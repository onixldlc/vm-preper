#!/bin/bash

# install neovim
sudo apt-get install neovim -y

# setup neovim configs (if they want)
read -p "install nvchad? (Y/n) " IFS_YES
IFS_YES="${IFS_YES:-Y}"
if [[ $IFS_YES =~ ^[Yy]$ ]]; then
    echo "adding nvchad..."
    git clone git@github.com:onixldlc/nvim-config.git $HOME/.config/nvim

    read -p "install nvchad to root? (Y/n) " IFS_YES2
    IFS_YES2="${IFS_YES2:-Y}"
    if [[ $IFS_YES2 =~ ^[Yy]$ ]]; then
        echo "adding nvchad to root..."
        sudo rm -d /root/.config/nvim
        sudo ln -s $HOME/.config/nvim /root/.config/nvim
    else
        echo "skipping nvchad for root..."
    fi

else
    echo "skipping nvchad..."
fi
