#!/bin/bash

# Always download the latest stable Go directly from go.dev (cross-distro, always >= latest)
LATEST_GO="$(curl -sSf https://go.dev/dl/ | \
    grep -oE 'href="/dl/go[0-9.]+\.linux-amd64\.tar\.gz"' | \
    grep -v 'rc\|beta' | \
    head -n 1 | \
    sed 's/href="\(.*\)"/\1/')"

echo "Installing Go from https://go.dev${LATEST_GO}"
curl -OLs "https://go.dev${LATEST_GO}"

sudo tar -C /usr/local -xzf "${LATEST_GO##*/}"
rm "${LATEST_GO##*/}"

echo 'export PATH=$PATH:/usr/local/go/bin' >> "$HOME/.profile"
echo 'export PATH=$PATH:$HOME/go/bin' >> "$HOME/.profile"

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
echo "Go installed: $(go version)"

