#!/bin/bash

# Detect OS type: Ubuntu or Debian
. /etc/os-release

# Exit early if not Ubuntu or Debian
if [[ "$ID" != "ubuntu" && "$ID" != "debian" ]]; then
    echo "Unsupported OS: $ID"
    exit 1
fi

# Set OS-specific variables
OS_NAME="$ID"

sudo apt-get update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL "https://download.docker.com/linux/$OS_NAME/gpg" -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$OS_NAME \
  $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin