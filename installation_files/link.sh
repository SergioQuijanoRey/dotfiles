#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Script to link the config files from the repo to my system
# Version:
# 		v1.0 - 17/04/2019: First documented version

# Script functions
#===============================================================================

# Description:
# 		Creates a link to a dir
# 		If the dir already exists, it creates a backup of it and then makes the link
# Parameters:
# 		$1: the absolute path to the source dir
# 		$2: the absolute path to the destination dir
# 		$3: the backup suffix (~ by default)
link_dir(){
	if [ -d $2 ]
	then
		echo "Making a backup of $2 on $2$3 and linking!"
		mv $2 $2$3
		ln -s -v -f -T $1 $2
	else
		ln -s -v -f -T $1 $2
	fi
}

# Script parameters
#===============================================================================
home="/home/sergio"
base_dir="$home/GitProjects/dotfiles"
dotfiles="$base_dir/config_files"

echo "home: $home"
echo "base dir: $base_dir"
echo "dotfiles: $dotfiles"

# Script process
#===============================================================================
echo "Executing linker!"

# Linking config files
ln -s -v -f $dotfiles/.bashrc $home/.bashrc
ln -s -v -f $dotfiles/.bash_profile $home/.bash_profile
ln -s -v -f $dotfiles/.bash_aliases $home/.bash_aliases
ln -s -v -f $dotfiles/.bash_functions $home/.bash_functions
ln -s -v -f $dotfiles/.vimrc $home/.vimrc
ln -s -v -f $dotfiles/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

# Linking folders
link_dir $dotfiles/.i3 $home/.i3 "~"
link_dir $dotfiles/.config/nvim $home/.config/nvim "~"
link_dir $dotfiles/.config/alacritty $home/.config/alacritty "~"
link_dir $dotfiles/.config/ranger $home/.config/ranger "~" 
link_dir $dotfiles/bin $home/bin "~" 
link_dir $dotfiles/.icons $home/.icons "~" 
link_dir $dotfiles/.fonts $home/.fonts "~"

echo "================================================================================"
echo "Linker executed succesfully"
