#!/bin/bash

### install language
echo "language list:"
echo "1. golang"
echo "2. nodejs"
echo "3. python"
echo "4. rust"
read -p "select language you want to install (1,3,4): " LANGS
LANGS="${LANGS:-1,3,4}"

for i in $(echo $LANGS | tr "," "\n"); do

    # install golang
    if [[ $i =~ ^[1]$ ]]; then
        echo "installing golang..."
        sudo add-apt-repository ppa:longsleep/golang-backports
        sudo apt update
        sudo apt install -y golang-go
        echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.profile

    # install nodejs
    elif [[ $i =~ ^[2]$ ]]; then
        echo "installing nodejs..."
        source <(curl -sSf "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh")
        source ~/.bashrc
        nvm install node

    # install python
    elif [[ $i =~ ^[3]$ ]]; then
        echo "installing python..."
        sudo apt install -y python3 python3-pip

    # install rust
    elif [[ $i =~ ^[4]$ ]]; then
        echo "installing rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash

    else
        echo "invalid selection, please select a valid language."
        echo "exiting..."
        exit 1
        
    fi
done
