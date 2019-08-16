# Author:
#     Sergio Quijano Rey
#     sergiquijano@gmail.com
# Description:
#     Gets the dotfiles from the git repo to the system
# Version:
#     v1.0: First documented version

# Script parameters
#===============================================================================
config_files_dir="$HOME/GitProjects/dotfiles/config_files/"

# Script running the instructions
#===============================================================================
rsync -zaP $config_files_dir $HOME
