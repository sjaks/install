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
# TODO: test and fix, use in non-virt

#################################
# INSTALL SPICETIFY AND  THEMES #
#################################

curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
mv ~/spicetify-cli ~/.local/spicetify

https://github.com/morpheusthewhite/spicetify-themes
git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
mkdir -p ~/.config/spicetify/Themes
cp -r * ~/.config/spicetify/Themes


#############
# SET THEME #
#############

./.local/spicetify/spicetify config current_theme Nord
./.local/spicetify/spicetify apply
