#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Makes installation stuff that don't fit in other scripts
# Version:
# 		v1.0 - 18/04/2019: First documented version

# Install vim packer for neovim
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install neovim dependencies
sudo pip3 install --upgrade --user pynvim
sudo pip install --upgrade --user pynvim
sudo pip3 install pynvim
sudo pip install pynvim

# .profile is a symlink to .bash_profile
# Some programs like rofi source .profile instead of .bash_profile. Also i3wm
# itself sources only .profile
rm $HOME/.profile
ln -s $HOME/.bash_profile $HOME/.profile
