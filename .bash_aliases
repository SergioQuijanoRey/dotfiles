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
alias v="vim"								# Useful for fast open vim
alias dasm="objdump -d"							# Useful for disassembly
alias getsyscall="cat /usr/include/asm/unistd_32.h | egrep "

# System config aliases
alias confi3="vim .i3/config"
alias vconf="vim .vimrc"
alias libinputconf="sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf"
alias reload="source .bashrc; source .bash_aliases; source .vimrc; xrdb .Xresources"

# Administration aliases
alias diskspace="du -d1 -lah"
alias psearch="ps aux | egrep"
alias release="lsb_release -a"
alias web="google-chrome-stable"

# Server aliases
alias localssh="ssh sergio@192.168.1.13"

# Others
alias pdc="pandoc --latex-engine=xelatex"
alias screensaver="cmatrix | lolcat"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
