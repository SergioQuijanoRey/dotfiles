#!/bin/bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Setups my whole system
# Version:
# 		v1.0 - 29/03/2019: First documented version
# 		v2.0 - 16/04/2019: Back to something functionally

# # Script Parameters
# home="/home/sergio"
# base_dir="$home/GitProjects/dotfiles"
# dotfiles="$base_dir/config_files"
# package_installer="$base_dir/installation_files/packages.sh"
# 
# # Symbolic links are set
# echo "Home: $home"
# echo "DOTFILES: $dotfiles"
# 
# for file in $dotfiles/*
# do
# 	file2=${file%$base_dir}
# 	echo "file: $file"
# 	echo "file2: $file2"
# 	#ln -s -f --target-directory=$home $file $file
# done
# 
# # Custom crontab is added
# sudo crontab -u sergio $dotfiles/.crontab
# 
# # Packages are installed
# chmod u+x $packages
# $packages

# Script parameters
#===============================================================================
home="/home/sergio"
base_dir="$home/GitProjects/dotfiles"
dotfiles="$base_dir/config_files"

ln -s -f $dotfiles/.i3 $home/.i3
ln -s -f $dotfiles/.bashrc $home/.bashrc
ln -s -f $doftiles/.bash_profile $home/.bash_profile
ln -s -f $doftiles/.bash_aliases $home/.bash_aliases
ln -s -f $dotfiles/.vimrc $home/.vimrc
ln -s -f $dotfiles/.config/nvim $home/.config/nvim
ln -s -f $dotfiles/.config/alacritty $home/.config/alacritty
ln -s -f $dotfiles/.config/ranger $home/.config/ranger
ln -s -f $dotfiles/bin $home/bin
