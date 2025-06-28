#!/bin/bash

### install containerization tool
echo "containerization list:"
echo "1. docker"
read -p "select containerization platform you want to install (1): " LANGS
LANGS="${LANGS:-1}"

for i in $(echo $LANGS | tr "," "\n"); do

    # install docker
    if [[ $i =~ ^[1]$ ]]; then
        source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/docker/install-docker.sh") 
        # sudo apt-get update
        # sudo apt-get -y install ca-certificates curl
        # sudo install -m 0755 -d /etc/apt/keyrings
        # sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        # sudo chmod a+r /etc/apt/keyrings/docker.asc

        # # Add the repository to Apt sources:
        # echo \
        #     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        #     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        #     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        # sudo apt-get update

        # sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    else
        echo "invalid selection, please select a valid language."
        echo "exiting..."
        exit 1
        
    fi
done