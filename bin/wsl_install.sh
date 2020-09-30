#!/bin/bash
#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Personalized script for configuring
# WSL Ubuntu
#
# Modules:
#  - global


###################
# EXECUTE MODULES #
###################

# Do global configuration only
source /home/sami/.files/bin/modules/global.sh


###########################
# CREATE LINKS TO WINDOWS #
###########################

# Create links to Windows directories
ln -sf /mnt/c/Users/Sami/ /home/sami/win


###############
# FINAL STEPS #
###############

# Clear apt cache
sudo apt -y autoclean
sudo apt -y autoremove

clear
echo ""
echo "  The script has finished running."
echo ""
