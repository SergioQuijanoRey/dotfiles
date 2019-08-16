#!/bin/bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Setups my whole system
# Version:
# 		v1.0 - 29/03/2019: First documented version
# 		v2.0 - 16/04/2019: Back to something functionally
#       v3.0 - 16/08/2019: Script adapted to new dotfiles which use rsync instead of links

# Script parameters
#===============================================================================
base_dir="$HOME/GitProjects/dotfiles/installation_files"

# Script process
#===============================================================================
base_dir/git.sh
base_dir/packages.sh
base_dir/download.sh
base_dir/other.sh
