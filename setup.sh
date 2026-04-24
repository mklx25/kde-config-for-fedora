#!/bin/bash

echo "Starting full system setup..."

# Update system
sudo dnf update -y

# Install KDE basics (safe even if already installed)
sudo dnf install -y \
plasma-desktop \
konsole \
dolphin \
git \
curl \
wget

# Optional: install Kvantum (if you use it)
sudo dnf install -y kvantum kvantum-qt5 2>/dev/null

# Enable RPM Fusion (for Steam, Spotify, etc.)
sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable Google Chrome repo
sudo dnf config-manager --set-enabled google-chrome

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Optional: common useful tools
sudo dnf install -y \
fastfetch \
htop \
neovim \
eza \
bat 2>/dev/null

# My custom apps
sudo dnf install -y \
blender \
discord \
code \
steam \
google-chrome-stable \
lpf-spotify-client \
fzf \
ranger \
cmatrix

# Run your restore script
echo "Applying your KDE config..."
chmod +x restore.sh
./restore.sh

echo "Setup complete!"
