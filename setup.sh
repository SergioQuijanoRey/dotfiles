#!/bin/bash

# Variables basicas
home="/home/sergio"
dotfiles="$home/GitProjects/dotfiles"

# Elimino los archivos originales
rm -f $home/.bashrc
rm -f $home/.bash_aliases
rm -f $home/.profile
rm -f $home/.Xresources
rm -f $home/.vimrc
rm -rf $home/.i3
rm -rf $home/.config/ranger
rm -rf $home/bin

# Creo los enlaces simbolicos
echo "Home: $home"
echo "DOTFILES: $dotfiles"

for file in .bashrc .bash_aliases .profile .Xresources .vimrc .i3 .config/ranger bin
do
	origin="$dotfiles/$file"
	dest="$home/$file"
	ln -s $origin $dest
done
