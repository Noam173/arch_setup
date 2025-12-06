#!/usr/bin/env bash

sudo chown -R $USER:$USER ~/.config
sudo pacman -S nano uv waybar firefox --noconfirm


sudo pacman -S pipewire-pulse pavucontrol --noconfirm
sudo systemctl enable pipewire-pulse --now


files="$(find "$(dirname "$0")" -name 'setup*')"


for script in $files;do

uv run "$script"

done


if [[ -f "$HOME/.bashrc" ]]; then

clear && source "$HOME/.bashrc"

fi


sudo pacman -S zed --noconfirm
cd "$HOME/.config"
rm -rf zed/
git clone https://github.com/noam173/zed


echo the paru config was copied to .config, please install paru from linutil
echo "launch linutil? [y/N]"
read -r ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then

curl -fsSL https://christitus.com/linux | sh

fi


echo "reboot? [Y/n]"
read -r ans
if [[ "$ans" != "n" && "$ans" != "N" ]]; then

reboot

fi
