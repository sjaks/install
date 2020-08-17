#!/bin/bash
#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Module for configuration done on actual PCs


####################
# INSTALL PACKAGES #
####################

# Install packages used on all actual machines;
# for instance GUI apps, dev tools etc.
sudo apt -y -q install \
ufw \
gimp \
obs-studio \
shotcut \
fonts-noto-color-emoji \
pavucontrol \
qt5-style-plugins \
papirus-icon-theme \
mesa-utils \
scrot \
texlive-latex-recommended \
texlive-lang-european \
poedit \
ruby-dev \
qt5-default \
qtcreator \
moreutils \
virtualbox \
virtualbox-dkms \
vagrant \
docker \
docker-compose \
inkscape \
dia \
audacity \
hardinfo \
steam \
telegram-desktop \
octave

# Install snap packages used on actual PCs
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install spotify
sudo snap install discord

# Install debs
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo apt -y install -f

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-bindfs

# Install vscode extensions
code --install-extension arcticicestudio.nord-visual-studio-code


###########################
# SET APPEARANCE SETTINGS #
###########################

# Fetch the GTK theme
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
mkdir /home/sami/.themes
tar -xvf Nordic-darker.tar.xz -C /home/sami/.themes/
rm Nordic-darker.tar.xz


###########################
# SET DIRECTORY SETTINMGS #
###########################

# Setup directories
mkdir -p /home/sami/.config/Code/User/
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link dotfiles and configs for GUI apps
ln -sf /home/sami/.files/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code/User/settings.json

# Link work gitconfig
ln -sf /home/sami/.files/rc/gitconfig-work /home/sami/.gitconfig-work


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Add user to docker group
sudo usermod -aG docker sami


########################
# Set network settings #
########################

# Enable firewall
sudo ufw enable
