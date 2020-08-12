#!/bin/bash
#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Personalized script for installing
# some essential packages on a server
#
# Modules:
#  - global


###################
# EXECUTE MODULES #
###################

# Do global configuration only
source /home/sami/.files/bin/modules/global.sh


#########################################
# INSTALL VERY SERVER SPECIFIC PACKAGES #
#########################################

sudo apt install nginx \
docker \
docker-compose


#######################################
# CREATE LINKS TO IMPORTANT LOCATIONS #
#######################################

ln -sf /var/www /home/sami/www
ln -sf /etc/nginx/sites-available/ /home/sami/nginx


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Add user to docker group
sudo usermod -aG docker sami

# Enable services
sudo systemctl enable nginx
sudo systemctl enable docker


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
