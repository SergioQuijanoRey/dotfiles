# Author:
#     Sergio Quijano Rey
#     sergiquijano@gmail.com
# Description:
#     Gets the dotfiles from the git repo to the system
# Version:
#     v1.0: First documented version

# Script parameters
#===============================================================================
config_files_dir="$HOME/GitRepos/dotfiles/config_files/"

# Script running the instructions
#===============================================================================
rsync -zaP $config_files_dir $HOME

# Writting the touchpad configuration to the X11 system config folder
sudo rsync -zaP $config_files_dir/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf    # For having nice touchpad setting
