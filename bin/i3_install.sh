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
# i3 on a Ubuntu machine
#
# Major bug with LVM in the live server .iso:
# https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning


###################
# EXECUTE MODULES #
###################

# Do global configuration
source /home/sami/.files/bin/modules/global.sh

# This is a GUI install on an actual PC
source /home/sami/.files/bin/modules/nonvirt.sh


######################
# CONFIGURE PACKAGES #
######################

# Install packages necessary with i3 with apt
sudo apt -y -q install \
xorg \
xinit \
dmenu \
i3 \
i3lock \
xss-lock \
i3status \
feh \
dunst \
network-manager-gnome \
gnome-keyring \
lxappearance \
mplayer \
mpv \
xbacklight \
blueman

# Install mons
cd /home/sami/Documents && git clone --recursive https://github.com/Ventto/mons.git
cd mons/ && sudo make install && cd /home/sami/.files


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Setup directories
mkdir /home/sami/Documents/
mkdir /home/sami/Downloads/
mkdir -p /home/sami/.config/i3/
mkdir -p /home/sami/.config/dunst

# Fetch and link dotfiles and configs
ln -sf /home/sami/.files/rc/xinitrc /home/sami/.xinitrc
ln -sf /home/sami/.files/rc/xresources /home/sami/.Xresources
ln -sf /home/sami/.files/rc/i3 /home/sami/.config/i3/config
ln -sf /home/sami/.files/rc/dunstrc /home/sami/.config/dunst/dunstrc


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Add systemd config
echo HandleLidSwitch=lock | sudo tee -a /etc/systemd/logind.conf
sudo systemctl daemon-reload
sudo systemctl disable systemd-networkd-wait-online
sudo systemctl mask systemd-networkd-wait-online


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
