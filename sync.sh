#!/bin/bash

echo "Syncing KDE config to GitHub..."

# Copy KDE config
cp ~/.config/kdeglobals config/ 2>/dev/null
cp ~/.config/kwinrc config/ 2>/dev/null
cp ~/.config/plasmarc config/ 2>/dev/null
cp ~/.config/plasma-org.kde.plasma.desktop-appletsrc config/ 2>/dev/null
cp ~/.config/kglobalshortcutsrc config/ 2>/dev/null

# KDE data
rm -rf local-share/plasma local-share/konsole
mkdir -p local-share
cp -r ~/.local/share/plasma local-share/ 2>/dev/null
cp -r ~/.local/share/konsole local-share/ 2>/dev/null

# Reset themes folder
rm -rf themes
mkdir -p themes/plasma themes/icons themes/kvantum themes/gtk

# Plasma themes
[ -d ~/.local/share/plasma/desktoptheme ] && cp -r ~/.local/share/plasma/desktoptheme themes/plasma/
[ -d ~/.local/share/plasma/look-and-feel ] && cp -r ~/.local/share/plasma/look-and-feel themes/plasma/

# Icons & cursors
[ -d ~/.local/share/icons ] && cp -r ~/.local/share/icons themes/icons/
[ -d ~/.icons ] && cp -r ~/.icons themes/icons/

# Color schemes
[ -d ~/.local/share/color-schemes ] && cp -r ~/.local/share/color-schemes themes/

# Kvantum
[ -d ~/.config/Kvantum ] && cp -r ~/.config/Kvantum themes/kvantum/
[ -d ~/.local/share/Kvantum ] && cp -r ~/.local/share/Kvantum themes/kvantum/

# GTK themes
[ -d ~/.themes ] && cp -r ~/.themes themes/gtk/
[ -d ~/.local/share/themes ] && cp -r ~/.local/share/themes themes/gtk/

# Bash config
cp ~/.bashrc . 2>/dev/null

# Git
git add .
git commit -m "Update KDE config $(date)"
git push

echo "Backup updated!"
