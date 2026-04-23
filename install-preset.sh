#!/bin/bash

# install-preset.sh — unattended install driven by a .env preset file
# Usage:
#   bash install-preset.sh                     # uses config/preset-dev.env
#   bash install-preset.sh config/my-preset.env

PRESET="${1:-config/preset-dev.env}"
REPO_RAW="https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main"

if [ ! -f /etc/lsb-release ]; then
    echo "Currently this script is only intended to run on Ubuntu environment."
    exit 1
fi

echo "Loading preset: $PRESET"

# Export each KEY=VALUE line from the remote preset file, skipping comments and blanks.
# Env vars already set in the environment take precedence over the preset file.
while IFS='=' read -r key value; do
    [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
    key="${key// /}"   # strip any spaces around key
    [[ -z "${!key}" ]] && export "$key=$value"
done < <(curl -sSf "$REPO_RAW/$PRESET")

echo "Starting install with preset: $PRESET"
bash <(curl -sSf "$REPO_RAW/script/setup/ubuntu/install-tools.sh")
