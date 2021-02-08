# Description:
# 	Bash aliases
# Author:
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Version:
# 	v1.0 04/12/2018 - First documented version
#   v2.0 24/06/2020 - Cleaned unused aliases

# Programming aliases
alias val="valgrind --leak-check=full"
alias hval="valgrind --tool=helgrind --leak-check=full"
alias py="python3"
alias jupy="jupyter notebook"
alias v="nvim"                                              # Useful for fast open nvim
alias vt="nvim term://bash"                                 # Open a terminal inside nvim
alias dasm="objdump -d"                                     # Useful for disassembly
alias getsyscall="cat /usr/include/asm/unistd_32.h | egrep "
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias compile="g++ -std=c++11 -lpthread"

# Git aliases
alias gcommit="git add . ; git commit"
alias gpush="git add . ; git commit ; git push"
alias glog="git log | nvim"
alias glogone="git log --oneline | nvim"

# System config aliases
alias confi3="nvim .i3/config"
alias vconf="nvim .config/nvim/init.vim"
alias libinputconf="sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf"
alias reload="source .bashrc; source .bash_aliases; source .profile"

# Administration aliases
alias ds="du -d0 -h"
alias unterminal="bg %1 && disown %1"
alias ls="exa"                          # Exa is a good replacement for ls
alias la="exa -a"

# Some nice colors hex values
alias palette_green="echo '#A6B290'"

# Gaming aliases
alias league_ready="sudo sysctl -w abi.vsyscall32=0"
