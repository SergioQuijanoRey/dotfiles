#!/bin/bash

# Variables basicas
pacman_list="./package_list.txt"
aur_list="./aur_list.txt"

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
	yaourt  -S $package --noconfirm
	echo ""
done

echo "Paquetes instalados!"
echo ""
