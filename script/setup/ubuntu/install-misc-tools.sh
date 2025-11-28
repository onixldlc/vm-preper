#!/bin/bash

### install misc tools
echo "misc tool list:"
echo "1. btop (requires: cmake)"
echo "2. ytop (requires: rust)"
echo "3. lazygit (requires: go)"
echo "4. lazydocker (requires: go)"
echo "5. neofetch"
read -p "Select a tool to install (1): " tool_choice
tool_choice="${tool_choice:-1}"

for i in $(echo $tool_choice | tr "," "\n"); do
    if [[ $i -eq 1 ]]; then
        echo "Installing btop..."
        bash <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/misc/btop.sh")

    elif [[ $i -eq 2 ]]; then
        echo "Installing ytop..."
        cargo install ytop

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

    else
        echo "Invalid choice: $i"
        echo "exiting..."
        exit 1
    fi
done