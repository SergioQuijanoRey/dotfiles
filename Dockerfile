FROM docker.io/library/archlinux

RUN pacman -Syy
RUN pacman -S sudo --noconfirm
COPY ./ /dotfiles
