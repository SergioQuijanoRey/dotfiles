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
ln -s -n -v -f -T $dotfiles/.i3 $home/.i3
ln -s -n -v -f -T $dotfiles/.config/nvim $home/.config/nvim
ln -s -n -v -f -T $dotfiles/.config/alacritty $home/.config/alacritty
ln -s -n -v -f -T $dotfiles/.config/ranger $home/.config/ranger
ln -s -n -v -f -T $dotfiles/bin $home/bin
ln -s -n -v -f -T $dotfiles/.icons $home/.icons
ln -s -n -v -f -T $dotfiles/.fonts $home/.fonts

echo "================================================================================"
echo "Linker executed succesfully"
