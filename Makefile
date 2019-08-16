# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Makefile to run different installers
# Version:
# 		v1.0 - 18/04/2019: First documented version
# 		v1.1 - 16/08/2019: Makefile for the second version of the dotfiles using 
# 						   rsync instead of links

# Makefile process
#===============================================================================
help:
	@echo "Makefile help:"
	@echo "	make packages: installs the packages of the system"
	@echo "	make download: gets the dotfiles from git into the host system"
	@echo "	make upload: uploads the dotfiles in the system to the git repository"

packages:
	@echo "Installing all the packages"
	./installation_files/packages.sh

download:
	@echo "Downloading the files from git to the system"
	./installation_files/download.sh

upload:
	@echo "Uploading the files from the system to git repository"
	@echo "A git push need to be done manually"
	./installation_files/upload.sh
