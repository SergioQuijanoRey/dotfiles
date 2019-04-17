#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Script to link the config files from the repo to my system
# Version:
# 		v1.0 - 17/04/2019: First documented version

# Script parameters
#===============================================================================
home="/home/sergio"
base_dir="$home/GitProjects/dotfiles"
dotfiles="$base_dir/config_files"
package_installer="$base_dir/installation_files/packages.sh"
linker="$base_dir/installation_files/link.sh"

# Script process
#===============================================================================
echo "Executing linker!"

# ln -s -f $dotfiles/.i3 $home/.i3
# ln -s -f $dotfiles/.bashrc $home/.bashrc
# ln -s -f $doftiles/.bash_profile $home/.bash_profile
# ln -s -f $doftiles/.bash_aliases $home/.bash_aliases
# ln -s -f $dotfiles/.vimrc $home/.vimrc
# ln -s -f $dotfiles/.config/nvim $home/.config/nvim
# ln -s -f $dotfiles/.config/alacritty $home/.config/alacritty
# ln -s -f $dotfiles/.config/ranger $home/.config/ranger
# ln -s -f $dotfiles/bin $home/bin

echo "================================================================================"
echo "Linker executed succesfully"
