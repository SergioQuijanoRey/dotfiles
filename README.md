# Sergio Quijano's Dotfiles

* Here you can find the dotfiles for my daily driver system, as well as a basic installer of the dotfiles using `Makefile`
* Clone this repo and type `make` for seeing which commands and actions you can perform with `Makefile`
* You may use this repo as a base for your dotfiles, but you may want to change:
    * Git repos that are automatically installed
    * Some scripts parameters
* Pull request and issues are wellcome!

# Prerequisites

* In order to use the `Makefile` installer you need to have already installed:
    * `git`: to clone this repo
    * `make`: to execute the `Makefile` commands
* If you're using `Arch`/`Manjaro`, you can install them with: `sudo pacman -S git make`

# TODO

* [ ] Rewrite all the scripts in a more modular and clean way
* [ ] Rewrite `README.md`, It's quite deprecated
* [ ] Write some test to the installer
    * [ ] Docker based testing
    * [ ] Create empty containter, based on Arch, and then try to install properly all the system
