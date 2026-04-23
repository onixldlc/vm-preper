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

# Translate a comma-separated list of names to numeric IDs for a given variable.
# Each install script only understands numbers — resolution happens here, once.
_resolve_ids() {
    local val="$1" map="$2" out=""
    while IFS= read -r item; do
        item="${item// /}"
        local id
        id=$(echo "$map" | grep -i "^${item}=" | cut -d= -f2)
        out+="${id:-$item},"
    done < <(echo "$val" | tr ',' '\n')
    echo "${out%,}"
}

# Name maps (name=id, one per line)
_LANGS_MAP="go=1
golang=1
node=2
nodejs=2
python=3
py=3
python3=3
rust=4"

_CONTAINERS_MAP="docker=1
podman=2"

_NETWORKS_MAP="nslookup=1
dig=1
dnsutils=1
ip=2
iproute2=2
ping=3
iputils-ping=3
traceroute=4
iperf3=5
iperf=5
mtr=6
nmap=7
tcpdump=8
wireshark=9
net-tools=10
netstat=10
ifconfig=10
arp=10
telnet=11"

_MISC_MAP="btop=1
bottom=2
btm=2
lazygit=3
lazydocker=4
neofetch=5
rsync=6
neovim=7
nvim=7"

# Load preset file — env vars already set in the environment take precedence.
while IFS='=' read -r key value; do
    [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
    key="${key// /}"
    [[ -z "${!key}" ]] && export "$key=$value"
done < <(curl -sSf "$REPO_RAW/$PRESET")

# Resolve names -> IDs for every INSTALL_* var that isn't already all-numeric/skip.
[[ -n "$INSTALL_LANGS"      && ! "$INSTALL_LANGS"      =~ ^[Nn]  ]] && export INSTALL_LANGS="$(_resolve_ids      "$INSTALL_LANGS"      "$_LANGS_MAP")"
[[ -n "$INSTALL_CONTAINERS" && ! "$INSTALL_CONTAINERS" =~ ^[Nn]  ]] && export INSTALL_CONTAINERS="$(_resolve_ids "$INSTALL_CONTAINERS" "$_CONTAINERS_MAP")"
[[ -n "$INSTALL_NETWORKS"   && ! "$INSTALL_NETWORKS"   =~ ^[Nn]  ]] && export INSTALL_NETWORKS="$(_resolve_ids   "$INSTALL_NETWORKS"   "$_NETWORKS_MAP")"
[[ -n "$INSTALL_MISC"       && ! "$INSTALL_MISC"       =~ ^[Nn]  ]] && export INSTALL_MISC="$(_resolve_ids       "$INSTALL_MISC"       "$_MISC_MAP")"

echo "Starting install with preset: $PRESET"
bash <(curl -sSf "$REPO_RAW/script/setup/ubuntu/install-tools.sh")
