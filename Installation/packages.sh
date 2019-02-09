#!/bin/bash

# Variables basicas
base_dir="/home/sergio/GitProjects/dotfiles/Installation/"
pacman_list="$base_dir/package_list.txt"
aur_list="$base_dir/aur_list.txt"

# Actualizo el sistema
echo "Actualizando el sistema por completo..."
sudo pacman -Syu
echo "Sistema actualizado!"
echo ""

# Instalo uno a uno los paquetes de pacman
echo "Instalando los paquetes especificados en $pacman_list ..."
for package in $(cat $pacman_list)
do
	echo "Instalando $packages..."
	sudo pacman -S $package --noconfirm
	echo ""
done

# Instalo uno a uno los paquetes de pacman
echo "Instalando los paquetes especificados en $aur_list ..."
for package in $(cat $aur_list)
do
	echo "Instalando $packages..."
	yay  -S $package --noconfirm
	echo ""
done

echo "Paquetes instalados!"
echo ""
