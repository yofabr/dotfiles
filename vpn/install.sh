#!/bin/bash

set -e

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    OS_LIKE=$ID_LIKE
else
    echo "Cannot detect OS. /etc/os-release not found."
    exit 1
fi

echo "Detected OS: $OS"

# Check for Debian/Ubuntu
if [[ "$OS" == "debian" || "$OS" == "ubuntu" || "$OS_LIKE" == *"debian"* ]]; then
    echo "Installing ProtonVPN for Debian/Ubuntu..."

    sudo apt update && sudo apt install -y wget apt-transport-https

    wget -qO- https://repo.protonvpn.com/debian/public_key.asc \
        | sudo tee /etc/apt/trusted.gpg.d/protonvpn.asc

    echo "deb [arch=amd64] https://repo.protonvpn.com/debian stable main" \
        | sudo tee /etc/apt/sources.list.d/protonvpn-stable.list

    sudo apt update && sudo apt install -y proton-vpn-gnome-desktop

# Check for Arch Linux
elif [[ "$OS" == "arch" || "$OS_LIKE" == *"arch"* ]]; then
    echo "Installing ProtonVPN for Arch Linux..."

    # Ensure an AUR helper is available (yay or paru)
    if command -v yay &>/dev/null; then
        AUR=yay
    elif command -v paru &>/dev/null; then
        AUR=paru
    else
        echo "No AUR helper found (yay or paru). Please install one first."
        exit 1
    fi

    $AUR -S --noconfirm proton-vpn-gtk-app

else
    echo "Unsupported OS: $OS"
    echo "This script supports Debian/Ubuntu and Arch Linux only."
    exit 1
fi

echo "ProtonVPN installation complete!"
