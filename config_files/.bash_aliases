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
alias v="nvim"                                              # Useful for fast open nvim
alias nv="nvim"                                             # Useful for fast open nvim
alias dasm="objdump -d"                                     # Useful for disassembly
alias getsyscall="cat /usr/include/asm/unistd_32.h | egrep "
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Git aliases
alias gcommit="git add . ; git commit"
alias gpush="git add . ; git commit ; git push"
alias glog="git log | nvim"

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
alias unterminal="bg %1 && disown %1"

# Server aliases
alias localssh="ssh sergio@$LOCALIP"
alias remotessh="ssh sergio@$REMOTEIP"
alias atcssh="ssh $atc_usr@atcgrid.ugr.es"

# Others
alias sims="cd /home/sergio/.wine/drive_c/Program\ Files\ \(x86\)/The\ Sims\ 4/Game/Bin && wine ./TS4_x64.exe"

