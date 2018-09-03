# Sergio Quijano's Dotfiles

## Progams need for working

| Name | Description | How to get |
| ---  | ---         | ---        |
| | |

## Some tutorial on how to config (working on english version of it)

* Para instalar `i3wm` en Ubuntu:
	* `sudo apt install i3`
* FEH
	* Sirve para configurar el fondo de pantalla que deseemos
	* `sudo apt install feh`
	* Para colocar un fondo de pantalla:
		* `feh --bg-scale {route}`, donde `route` es la ruta absoluta de la imagen
* ARANDR
	* Sirve para personalizar el monitor, con interfaz gráfica
	* Especialmente útil si se quiere usar `i3-wm` con varios monitores
	* `sudo apt install arandr`
* FUENTES
	* Instalación
		* Creo un `.fonts` en `HOME`
		* Descargo las fuentes, las descomprimo y muevo todos los `.ttf` al directorio
	* Fonts Awesome
		* Fuentes para poder colocar en los iconos de los workspaces
		* Se pueden bajar de [github](https://github.com/FortAwesome/Font-Awesome)
	* System San Francisco
		* Fuentes de `MAC OS X`
		* Se encuentra en [github](https://github.com/supermarin/YosemiteSanFranciscoFont)
		* Hay que configurar el `config_file` de i3 para que el sistema las adapte
* GTK THEME
	* lxappearence
		* `sudo apt install lxappearence`
		* Para poder usar `default-fonts` en temas `GTK`, editamos:
			* `~/.gtkrc-2.0`
			* `~/.config/gtk-3.0/settings.ini`
		* Para evitar esto últimon en `lxappearence` la fuente `System San Francisco` aparece abreviada como `SSFN Display`
* LANZADOR DE MENUS
	* ROFI
		* `sudo apt install rofi`
* COMPOSITOR DE SISTEMA
	* COMPTON
		* `sudo apt install compton`
* I3-BAR
	* i3-blocks
		* `sudo apt install i3blocks`
		* Sirve para remplazar el `status_command i3status` con `status_command i3blocks`
		* Conviene copiar la configuaración de `i3blocks` en el `home`: `cp /etc/i3blocks.conf .i3/i3blocks.conf`
* VOLUME CONTROL
	* pavu
		* Menu gráfico para tener configuración del audio
		* `sudo apt install pavucontrol`