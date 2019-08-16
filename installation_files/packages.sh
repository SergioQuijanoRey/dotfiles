#!/bin/bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Automatic package installer on arch-based systems
# Version:
# 		v1.0 - 29/03/2019: First documented version

# Script parameters
#===============================================================================
base_dir="$HOME/GitProjects/dotfiles/installation_files/"
pacman_list="$base_dir/package_list.txt"
aur_list="$base_dir/aur_list.txt"
aur_manager="yay"

# Script process
#===============================================================================
# System update
echo "Uptading and upgrading the system"
sudo pacman -Syyu
echo "Update done!"
echo ""

# Pacman packages are installed
echo "Installing pacman packages specified at $pacman_list ..."
for package in $(cat $pacman_list | grep -o '^[^#]*')
do
	echo "Installing $package..."
	sudo pacman -S $package --noconfirm
	echo ""
done

# AUR packages are installed
echo "Installing AUR packages specified at $aur_list ..."
for package in $(cat $aur_list | grep -o '^[^#]*')
do
	echo "Installing $package..."
	$aur_manager  -S $package --noconfirm
	echo ""
done

echo "Installation completed successfully!"
