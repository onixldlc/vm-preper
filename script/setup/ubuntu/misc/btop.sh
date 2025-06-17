#!/bin/bash

# pre-requisite
sudo apt install -y cmake 

# install btop
wget https://github.com/aristocratos/btop/releases/download/v1.4.0/btop-x86_64-linux-musl.tbz && \
    tar -xvf btop-x86_64-linux-musl.tbz ./btop && \
    cd ./btop && \
    sudo make install && \
    cd ..

# clean up
rm btop-x86_64-linux-musl.tbz


# add theme
wget https://raw.githubusercontent.com/catppuccin/btop/refs/heads/main/themes/catppuccin_macchiato.theme
mkdir -p $HOME/.config/btop/themes
mv catppuccin_macchiato.theme $HOME/.config/btop/themes
