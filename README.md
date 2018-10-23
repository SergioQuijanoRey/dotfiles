# Sergio Quijano's Dotfiles

## Purpose

* This github page was born due to some request on [this](https://www.reddit.com/r/unixporn/comments/9con7z/i3_simple_and_clean_workflow/) reddit post I made.
* It's my first time doing this, so if you have any advice please let me know
* Heavily inspired on [this](https://www.youtube.com/watch?v=8-S0cWnLBKg&index=2&list=PL7DwkYSG4a4rXgz5G4LBWYfaBDFHYwbqB&t=1s), so check it out (*btw, great teacher*)

# What you can find here

* `.i3`: all my config files and scripts, so you just need to install apps and dependencies to imitate my system
* `README.md`: it has the tutorial you see here 

## Some tutorial on how to config

* Base system
	* `ubuntu 18.04 LTS`
* Window manager
	* `i3-wm`
	* Once `ubuntu` is installed, make `sudo apt install i3` and reboot your system
* Background slide
	* `feh`
	* Make `sudo apt install feh`
	* One of my scripts make use of this
* Multiple monitors
	* `arandr`
	* You should use it to manage multiple monitors
	* `sudo apt install arandr`
* Fonts
	* How to use and install fonts
		* Create `.fonts` at your home dir
		* Download the fonts in zip files, uncompress it and move `*.tff` to fonts dir
	* Fonts I'm using:
		* `Font Awesome` for icons: [download](https://github.com/FortAwesome/Font-Awesome)
		* `System San Francisco` for `MACOSX` font: [download](https://github.com/supermarin/YosemiteSanFranciscoFont)
* GTK themes
	* `lxappearence`
	* For tweaking themes and fonts you downloaded
	* `sudo apt install lxappearence`
	* Themes I use:
		* `Pop! theme` by *System76*: use it for icons
		* `Arc theme`: use it for the rest
* Menu Launcher
	* `rofi` is used as replace of `dmenu`
	* It's configured on `~/.i3/config` file
	* Themes are put on `~/.i3/rofithemes`
	* `sudo apt install rofi`
* System Compositor
	* `compton` allows transparencies and subtle transitions on i3
	* `sudo apt install compton`
	* No config needed
* Bar
	* `i3blocks` as a replace of default `i3-bar`
	* Configured on `~/.i3/i3blocks.conf`
	* `sudo apt install i3blocks`
