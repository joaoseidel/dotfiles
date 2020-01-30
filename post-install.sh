#!/bin.sh

## Update the system
sudo pacman -Syu

## Create the temporary installation folder
 mkdir ~/post-install-temp
cp -r polybar/ ~/post-install-temp
cd ~/post-install-temp

## Install git
pacman -Sy git

## Install yay package manager
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd ..

## Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install SDKman!
curl -s "https://get.sdkman.io" | bash

## Install Polybar
# Preinstall
yay -S siji-git && yay -S ttf-font-awesome
yay -S polybar-git
cp polybar/ ~/.config/polybar

# Remove temporary folder
rm -rf ~/post-install-temp/
