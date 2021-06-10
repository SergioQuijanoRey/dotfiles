# Source my configs saved in other file
#===============================================================================

if [ -f "$HOME/.bash_dotfiles" ];
then
    source ~/.bash_dotfiles
else
    echo "Missing ~/.bash_dotfiles"
fi
