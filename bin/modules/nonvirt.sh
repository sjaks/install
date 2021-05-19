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
flake8 \
php-codesniffer \
ruby-dev \
ruby-bundler \
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
octave \
arc-theme

# Install debs
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -O /tmp/discord.deb https://discordapp.com/api/download?platform=linux&format=deb
wget -O /tmp/code.deb https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.48.0-1597304990_amd64.deb
wget -O /tmp/spotify.deb http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.1.26.501.gbe11e53b-15_amd64.deb
wget -O /tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.8.0-amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo dpkg -i /tmp/discord.deb
sudo dpkg -i /tmp/code.deb
sudo dpkg -i /tmp/spotify.deb
sudo dpkg -i /tmp/slack.deb
sudo apt -y install -f

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-bindfs

# Install vscode extensions
code --install-extension ph-hawkins.arc-plus


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
