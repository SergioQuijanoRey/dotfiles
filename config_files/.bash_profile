# Author
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Description:
# 	Customized .bash_profile
# Version
# 	v1.0 23/10/2018 - First functionally version
#   v2.0 01/04/2020 - Trash is cleaned

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# My personal paths
#==============================================================================
PATH="$PATH:/home/sergio/bin"
PATH="$PATH:/home/sergio/.i3/scripts"

# Enviroment vars
#===============================================================================

# NVIM + URXVT Stack
export EDITOR="nvim"
export VISUAL="nvim"
export TERMCMD="kitty"
export COLORTERM="kitty"

# I3WM vars
export BROWSER="brave"

# To force fzf.vim to ignore .gitignore files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
