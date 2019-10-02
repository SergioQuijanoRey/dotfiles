# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Bash functions
# Version:
# 		v1.0 - 17/04/2019: First documented version

# Script para extraer todo tipo de archivos
function extract(){
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *.xz)        unxz $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Script para tener fzf con cd
function cdf(){
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Script para tener fzf con neovim
function nvf(){
		file=$(fzf)
		nvim "$file"
}

# Script para buscar procesos
function findps(){
    ps aux | egrep $1 | egrep -v egrep | egrep -v grep | egrep $1
}
