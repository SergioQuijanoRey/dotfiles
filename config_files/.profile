# Source my configs saved in other file
#===============================================================================

if [ -f "$HOME/.bash_dotfiles" ];
then
    source ~/.bash_dotfiles
else
    echo "Missing ~/.bash_dotfiles"
fi

export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
