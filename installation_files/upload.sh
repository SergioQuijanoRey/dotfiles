# Author:
#     Sergio Quijano Rey
#     sergiquijano@gmail.com
# Description:
#     Gets the config files from my system to the git repo
#     A manual git push is need
# Version:
#     v1.0 - 16/08/2019 - First documented version
#     v2.0 - 28/03/2020 - Some trash dotfiles (ie. .bash_logout .bash_history)
#                         are not uploaded to the git repo. Also fonts and icons
#                         folders, which are useless, are not copied. Termite
#                         changed for Alacritty

# Script parameters
#===============================================================================
config_files_dir="$HOME/GitProjects/dotfiles/config_files"

# Running the script
#===============================================================================

# Syncing bash config files
rsync -zaP "$HOME/.bash*" "$config_files_dir/"

# Syncing git config files
rsync -zaP $HOME/.gitconfig $config_files_dir

# Syncing single folders
rsync -zaP $HOME/.i3 $config_files_dir
rsync -zaP $HOME/bin $config_files_dir
rsync -zaP $HOME/backgrounds $config_files_dir

# Syncing folders in $HOME/.config
for folder in nvim alacritty ranger
do
    rsync -zaP $HOME/.config/$folder $config_files_dir/.config
done

# Removing trash files
rm -rf "$config_files_dir/.bash_history"
rm -rf "$config_files_dir/.bash_logout"
rm -rf "$config_files_dir/.config/ranger/bookmarks"
rm -rf "$config_files_dir/.config/ranger/history"
