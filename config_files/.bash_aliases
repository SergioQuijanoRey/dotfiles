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
alias emulator="~/Android/Sdk/emulator/emulator @Pixel_5_API_30"

# Git aliases
alias gcommit="git add . ; git commit"
alias gpush="git add . ; git commit ; git push"
alias glog="git log | nvim"
alias glogone="git log --oneline | nvim"
alias gw="git worktree"
alias ggraph="git log --graph"

# System config aliases
alias confi3="nvim .i3/config"

# Administration aliases
alias filesize="du -d0 -h"

# Gaming aliases
alias league_ready="sudo sysctl -w abi.vsyscall32=0; sudo sysctl dev.i915.perf_stream_paranoid=0"

# Replacements (change one command to use other)
alias ls="exa"                          # Exa is a good replacement for ls
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -la"
alias cat="bat -p"

# Get my ip
alias myip="curl http://ipecho.net/plain; echo"

# Connect to uni vpn
alias vpnuni="sudo /opt/cisco/anyconnect/bin/vpnui"

# Use zoxide to move fast between dirs
alias cd="z"
