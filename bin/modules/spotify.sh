#!/bin/bash
#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Module for applying a theme for Spotify

#################################
# INSTALL SPICETIFY AND  THEMES #
#################################

sudo chmod a+wr /usr/share/spotify/
sudo chmod a+wr /usr/share/spotify/Apps -R

curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
mv  /home/sami/spicetify-cli ~/.local/spicetify
git clone https://github.com/morpheusthewhite/spicetify-themes.git
mkdir -p /home/sami/.local/spicetify/Themes
mv spicetify-themes/* /home/sami/.local/spicetify/Themes/
rm -rf spicetify-themes
chmod +x /home/sami/.local/spicetify/spicetify 


#############
# SET THEME #
#############

/home/sami/.local/spicetify/spicetify config current_theme Nord
/home/sami/.local/spicetify/spicetify backup apply
