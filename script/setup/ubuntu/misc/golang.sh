#!/bin/bash

# Detect if OS is Ubuntu
. /etc/os-release

if [[ "$ID" == "ubuntu" ]]; then
        sudo -E add-apt-repository ppa:longsleep/golang-backports -y
        sudo -E apt update
        sudo -E apt install -y golang-go
else
        # get the lates version of go
        LATEST_GO="$(curl -s https://go.dev/dl/ |
                grep -E 'class="download".+linux-amd64.tar.gz' |
                grep -v 'rc' |
                head -n 1 |
                sed 's/.*href=\"\(.\+\)\".*/\1/')"
        curl -OLs "https://go.dev${LATEST_GO}"
        
        # extract the tar
        sudo -E tar -C "/usr/local" -xvzf "${LATEST_GO//\/dl\/}"
        rm "${LATEST_GO//\/dl\/}"
        
        # add extraction path to $PATH
        echo 'export PATH=$PATH:/usr/local/go/bin' >> "$HOME/.profile"
fi

echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.profile

