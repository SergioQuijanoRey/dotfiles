FROM docker.io/library/archlinux

# Packages
RUN pacman -Syy
RUN pacman -S sudo neovim --noconfirm

# Simulate my dir structure
# TODO -- create user sergio with home dir and then create my dir structure
RUN mkdir -p /home/sergio/GitProjects/
COPY ./ /home/sergio/GitProjects/dotfiles
WORKDIR /home/sergio/GitProjects/dotfiles
