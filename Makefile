# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Makefile to run different installers
# Version:
# 		v1.0 - 18/04/2019: First documented version

# Makefile process
#===============================================================================
help:
		@echo "Makefile help:"
		@echo "	make help: shows this help"
		@echo "	make setup: runs setup, that's to say, all the installers at once"
		@echo "	make packages: runs the package installer"
		@echo "	make link: runs the linker script"
		@echo "	make git: runs the git installer"
		@echo "	make other: runs the rest of installers"

setup:
		@sudo ./installation_files/setup.sh

packages:
		@./installation_files/packages.sh

link:
		@sudo ./installation_files/link.sh

other:
		@sudo ./installation_files/other.sh
