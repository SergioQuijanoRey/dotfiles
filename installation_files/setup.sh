#!/bin/bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Setups my whole system
# Version:
# 		v1.0 - 29/03/2019: First documented version
# 		v2.0 - 16/04/2019: Back to something functionally

# Script parameters
#===============================================================================
home="/home/sergio"
base_dir="$home/GitProjects/dotfiles"
dotfiles="$base_dir/config_files"
package_installer="$base_dir/installation_files/packages.sh"

ln -s -f $dotfiles/.i3 $home/.i3
ln -s -f $dotfiles/.bashrc $home/.bashrc
ln -s -f $doftiles/.bash_profile $home/.bash_profile
ln -s -f $doftiles/.bash_aliases $home/.bash_aliases
ln -s -f $dotfiles/.vimrc $home/.vimrc
ln -s -f $dotfiles/.config/nvim $home/.config/nvim
ln -s -f $dotfiles/.config/alacritty $home/.config/alacritty
ln -s -f $dotfiles/.config/ranger $home/.config/ranger
ln -s -f $dotfiles/bin $home/bin

chmod u+x $package_installer
$package_installer
