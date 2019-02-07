# Author
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Description:
# 	Customized .profile 
# Version
# 	v1.0 23/10/2018 - First functionally version
# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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
PATH="$PATH:/home/sergio/.launchers"

# Enviroment vars
#===============================================================================

# VIM + URXVT Stack
export EDITOR="nvim"
export VISUAL="nvim"
export TERMCMD="urxvt"
export TERM="urxvt"
export COLORTERM="urxvt"

# SSH vars
export RASPIP="192.168.1.5"
