#!/bin/bash

### install misc tools
echo "misc tool list:"
echo "1. btop (requires: cmake)"
echo "2. bottom/btm (requires: rust)"
echo "3. lazygit (requires: go)"
echo "4. lazydocker (requires: go)"
echo "5. neofetch"
echo "6. rsync"
echo "7. neovim" 
tool_choice="${INSTALL_MISC:-}"
if [ -z "$tool_choice" ]; then
    read -p "Select a tool to install (1): " tool_choice
    tool_choice="${tool_choice:-1}"
fi

### reload profile/bashrc in case PATH changed (e.g. rust/go installs)
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
# explicitly extend PATH for go and cargo if installed
[ -d "$HOME/go/bin" ]          && export PATH="$PATH:$HOME/go/bin"
[ -d "/usr/local/go/bin" ]     && export PATH="$PATH:/usr/local/go/bin"
[ -d "$HOME/.cargo/bin" ]      && export PATH="$PATH:$HOME/.cargo/bin"

for i in $(echo $tool_choice | tr "," "\n"); do
    if [[ $i -eq 1 ]]; then
        echo "Installing btop..."
        bash <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/misc/btop.sh")

    elif [[ $i -eq 2 ]]; then
        echo "Installing bottom (btm)..."
        cargo install bottom

    elif [[ $i -eq 3 ]]; then
        echo "Installing lazygit..."
        go install github.com/jesseduffield/lazygit@latest

    elif [[ $i -eq 4 ]]; then
        echo "Installing lazydocker..."
        go install github.com/jesseduffield/lazydocker@latest
        sudo ln -s $HOME/go/bin/lazydocker /bin/

    elif [[ $i -eq 5 ]]; then
        echo "Installing neofetch..."
        sudo apt-get update
        sudo apt-get install neofetch -y

    elif [[ $i -eq 6 ]]; then
        echo "Installing rsync..."
        sudo apt-get update
        sudo apt-get install rsync -y

    elif [[ $i -eq 7 ]]; then
        echo "Installing neovim..."
        sudo apt-get update
        bash <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/misc/neovim.sh")

    else
        echo "Invalid choice: $i"
        echo "exiting..."
        exit 1
    fi
done
