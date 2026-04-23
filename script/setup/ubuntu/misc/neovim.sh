#!/bin/bash

# install neovim — tries latest prebuilt tarball from GitHub, falls back to apt
_install_neovim_latest() {
    local arch asset url
    arch="$(uname -m)"
    case "$arch" in
        x86_64)        asset="nvim-linux-x86_64.tar.gz" ;;
        aarch64|arm64) asset="nvim-linux-arm64.tar.gz" ;;
        *)             echo "Unsupported arch: $arch"; return 1 ;;
    esac

    url="$(curl -sSf "https://api.github.com/repos/neovim/neovim/releases/latest" \
        | grep -o '"browser_download_url": "[^"]*'"${asset}"'"' \
        | head -1 | cut -d'"' -f4)"
    [[ -z "$url" ]] && echo "Could not resolve latest neovim release URL" && return 1

    echo "Downloading latest neovim: $url"
    curl -sSfL "$url" -o /tmp/nvim.tar.gz || return 1
    # tarball extracts as nvim-linux-<arch>/{bin,lib,share,...} — strip root dir into /usr/local
    sudo tar -C /usr/local -xzf /tmp/nvim.tar.gz --strip-components=1 || return 1
    rm /tmp/nvim.tar.gz
    # symlink into /usr/bin so it's found regardless of PATH or stale shell hash
    sudo ln -sf /usr/local/bin/nvim /usr/bin/nvim
    hash -r 2>/dev/null || true
    echo "Neovim installed: $(nvim --version | head -1)"
}

echo "Installing neovim..."
if _install_neovim_latest; then
    echo "Latest neovim installed successfully."
else
    echo "Falling back to apt..."
    sudo apt-get update
    sudo apt-get install neovim -y
fi

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
