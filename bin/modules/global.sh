#!/bin/bash
#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Module for configuration done on all systems


######################
# CONFIGURE PACKAGES #
######################

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade

# Install global packages used on all machines
sudo apt -y -q install \
liquidprompt \
neofetch \
unzip \
htop \
catimg \
ccze \
colordiff \
vim \
curl \
wget \
mlocate \
silversearcher-ag \
git \
net-tools \
traceroute \
nmap \
whois \
idn \
influxdb-client \
gcc \
build-essential \
python3 \
python3-pip \
nodejs \
npm \
rsync \
entr \
ncdu \
cowsay


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Fetch and link global dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/liquidpromptrc /home/sami/.liquidpromptrc
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc
sudo ln -sf /home/sami/.files/rc/liquidpromptrc /root/.liquidpromptrc

# Load vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null
