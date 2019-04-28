# Description:
# 	Bash aliases
# Author:
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Version:
# 	v1.0 04/12/2018 - First documented version

# Programming aliases
alias val="valgrind --leak-check=full"
alias py="python3"
alias jupy="jupyter notebook"
alias v="nvim"									# Useful for fast open nvim
alias nv="nvim"									# Useful for fast open nvim
alias dasm="objdump -d"								# Useful for disassembly
alias getsyscall="cat /usr/include/asm/unistd_32.h | egrep "
alias gitsubir="git add . ; git commit ; git push"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# System config aliases
alias confi3="nvim .i3/config"
alias vconf="nvim .vimrc"
alias nvconf="nvim .nvimrc"
alias libinputconf="sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf"
alias reload="source .bashrc; source .bash_aliases; source .profile"

# Administration aliases
alias ds="du -d0 -h"
alias release="lsb_release -a"
alias web="firefox"
alias findps="ps aux | egrep"
alias ll='ls -alF'
alias la='ls -A'

# Server aliases
alias localssh="ssh sergio@$LOCALIP"
alias remotessh="ssh sergio@$REMOTEIP"
alias atcssh="ssh $atc_usr@atcgrid.ugr.es"
