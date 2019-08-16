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
git_folder="$home/GitProjects"
dotfiles="$base_dir/config_files"

echo "home: $home"
echo "base dir: $base_dir"
echo "dotfiles: $dotfiles"

# Script process
#===============================================================================
echo "Executing linker!"

# Linking config files
ln -s -v -f $dotfiles/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf


echo "================================================================================"
echo "Linker executed succesfully"
