# List of shared packages that we are going to use in WM enviroments
# No matter which window manager we are using, we might want this packages
{ pkgs, latestpkgs, ... }:

[
  pkgs.arandr # To control multiple displays
  pkgs.lxappearance # Set the system theme
  pkgs.networkmanagerapplet # Applet to connect to wifi
  pkgs.scrot # To take screenshots
  pkgs.betterlockscreen # For locking the screen
  pkgs.dunst # Notifications
  pkgs.libnotify # To have access to notify-send with dunst
  pkgs.imagemagick # For blurring the lock screen
  pkgs.feh # For setting the wallpaper
  pkgs.arc-theme # Preferred theme
  pkgs.rofi # App launcher
  pkgs.wofi # Rofi substitute for waybar
  pkgs.rofimoji # Have a rofi emoji selector
  pkgs.playerctl # To have play pause
  pkgs.acpi # Check for battery status
]
