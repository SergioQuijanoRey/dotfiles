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

# Administration aliases
alias diskspace="du -d1 -lah"
alias release="lsb_release -a"
alias web="google-chrome-stable"

# Server aliases
alias localssh="ssh sergio@192.168.1.13"

# Others
alias pdc="pandoc --latex-engine=xelatex"
