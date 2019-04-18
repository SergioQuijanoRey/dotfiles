#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Makes installation stuff that don't fit in other scripts
# Version:
# 		v1.0 - 18/04/2019: First documented version

# Install vim plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install neovim dependencies
gem install neovim
sudo pip install --upgrade --user pynvim
sudo pip2 install --upgrade --user pynvim
