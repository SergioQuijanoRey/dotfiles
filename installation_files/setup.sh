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
base_dir="$home/GitProjects/dotfiles"
dotfiles="$base_dir/config_files"
package_installer="$base_dir/installation_files/packages.sh"

# Symbolic links are set
echo "Home: $home"
echo "DOTFILES: $dotfiles"

for file in $dotfiles/*
do
	file2=${file%$base_dir}
	echo "file: $file"
	echo "file2: $file2"
	#ln -s -f --target-directory=$home $file $file
done

# Custom crontab is added
sudo crontab -u sergio $dotfiles/.crontab

# Packages are installed
chmod u+x $packages
$packages
