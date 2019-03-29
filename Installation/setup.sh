#!/bin/bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Setups my whole system
# Version:
# 		v1.0 - 29/03/2019: First documented version

# Script Parameters
home="/home/sergio"
dotfiles="$home/GitProjects/dotfiles"
packages="$dotfiles/Installation/packages.sh"

# Original files are removed
rm -f $home/.bashrc
rm -f $home/.bash_aliases
rm -f $home/.profile
rm -f $home/.vimrc
rm -rf $home/.i3
rm -rf $home/.config/ranger
rm -rf $home/.config/nvim
rm -rf $home/.cofig/alacritty
rm -rf $home/bin

# Symbolic links are set
echo "Home: $home"
echo "DOTFILES: $dotfiles"

for file in .bashrc .bash_aliases .profile .Xresources .vimrc .i3 bin .config/ranger .config/nvim .config/alacritty 
do
	origin="$dotfiles/$file"
	dest="$home/$file"
	ln -s $origin $dest
done

# Custom crontab is added
sudo crontab -u sergio $dotfiles/.crontab

# Packages are installed
chmod u+x $packages
$packages
