#!/usr/bin/env python3

import sys
import os

# Allows diferent package managers
class package_manager:
    def __init__(self):
        self.updatecmd = ""
        self.upgradecmd = ""
        self.installcmd = ""
        self.searchcmd = ""
        self.problempkgs = []

    def __str__(self):
        data = ""

        data = data + "Update: : " + self.updatecmd + "\n"
        data = data + "Upgrade: " + self.upgradecmd + "\n"
        data = data + "Install: " + self.installcmd + "\n"
        data = data + "Search: " + self.searchcmd + "\n"

        return data

    def set_commands(self, newupdate, newupgrade, newinstall, newsearch):
        self.updatecmd = newupdate
        self.upgradecmd = newupgrade
        self.install = newinstall
        self.search = newsearch

    def update(self):
        os.system(self.updatecmd)

    def upgrade(self):
        os.system(self.upgradecmd)

    def install(self, package_name):
        try:
            os.system(self.installcmd + package_name)
        except:
            print("Error installing {}".format(package_name))
            print("Similar packages: ")
            print(self.search(package_name))
            self.problempkgs.append(package_name)

    def search(self, package_name):
        os.system(self.searchcmd + package_name)

    def status(self):
        print("Problematic packages which were tried to install:")
        for pkg in self.problempkgs:
            print("\t" + pkg)
    
    def clean_status(self):
        self.problempkgs = []

def install_package_list(pmanager, dependencies_list):
    # System update
    pmanager.update()

    # System upgrade
    pmanager.upgrade()
    
    # All the packages are installed
    for dependencie in dependencies_list:
        pmanager.install(dependencie)

    # Problematic packages are returned
    return pmanager.problempkgs


# Some useful package managers
arch = package_manager()
arch.set_commands(
        "sudo pacman -Sy",
        "sudo pacman -Su", 
        "sudo pacman -S",
        "sudo pacman -Ss"
)

yaourt = package_manager()
yaourt.set_commands(
        "yaourt -Sy",
        "yaourt -Su", 
        "yaourt -S",
        "yaourt -Ss"
)

# By default, arch is used for package manager
pkgmanager = arch

# Minimal dependencies needed
dependencies = [
    # I3 packages
    "rofi",
    "compton",
    "pavu-control",
    "feh",
    "arandr",
    "i3blocks",
    "blueman",
    "ranger",
    "urxvt",
    "pa-applet",
    "nm-applet",
    "lxappearence",

    # Programming packages
    "vim",
    "gedit",
    "git",
    "gcc",
    "jupyter"

    # Terminal utilities
    "pandoc",
    "neofetch",
    "htop",
    "tree",

    # Other utilities
    "evince",
    "calibre",
    "google-chrome",
    "telegram",
]

# Packages are installed
problempkgs = install_package_list(arch, dependencies)
problempkgs = install_package_list(yaourt, problempkgs)

# Packages that couldn't be installed
print("Non installed packages:")
for pkg in problempkgs:
    print(pkg, end = " ")
print("")


