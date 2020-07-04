#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Descriptions:
# 		Clones my git repos
# Version:
# 		v1.0 - 18/04/2019: First documented version

# Script parameters
#===============================================================================
project_folder="/home/sergio/GitProjects"

# Script process
#===============================================================================
cd $project_folder
git clone git@gitlab.com:SergioQuijano/Universidad.git
git clone git@gitlab.com:SergioQuijano/misArchivos.git
