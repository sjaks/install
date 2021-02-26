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


############
# DO SETUP #
############

# Create links to Windows directories
ln -sf /mnt/d/Code /home/sami/code

# Disable motd
touch /home/sami/.hushlogin


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
