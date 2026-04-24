#!/bin/bash

echo "Restoring KDE config..."

# Config
cp config/* ~/.config/

# KDE data
cp -r local-share/plasma ~/.local/share/ 2>/dev/null
cp -r local-share/konsole ~/.local/share/ 2>/dev/null

# Themes
cp -r themes/plasma/* ~/.local/share/plasma/ 2>/dev/null
cp -r themes/icons/* ~/.local/share/ 2>/dev/null
cp -r themes/color-schemes ~/.local/share/ 2>/dev/null
cp -r themes/kvantum/* ~/.config/ 2>/dev/null
cp -r themes/gtk/* ~/ 2>/dev/null

# Bashrc
[ -f .bashrc ] && cp .bashrc ~/

echo "Restarting KDE..."
kquitapp5 plasmashell && kstart5 plasmashell

echo "Done!"
