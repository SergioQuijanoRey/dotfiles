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
linker="$base_dir/installation_files/link.sh"

# Script process
#===============================================================================

# Linking all the files
chmod u+x $linker
$linker

# Installing all the packages
chmod u+x $package_installer
$package_installer
