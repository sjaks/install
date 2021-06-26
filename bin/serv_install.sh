# .files
# sjaks@github.com


###################
# EXECUTE MODULES #
###################

# Do global configuration
source /home/sami/.files/bin/modules/global.sh

# Get rid of snap
source /home/sami/.files/bin/modules/snap.sh


#########################################
# INSTALL VERY SERVER SPECIFIC PACKAGES #
#########################################

sudo apt install -y nginx \
docker \
docker-compose


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Add user to docker group
sudo usermod -aG docker sami

# Enable services
sudo systemctl enable nginx
sudo systemctl enable docker

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
