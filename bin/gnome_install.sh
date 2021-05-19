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
# an Ubuntu Gnome installation
#
# Modules:
#  - global
#  - nonvirt
#  - snap
#  - spotify


###########################
# INITIALIZE INSTALLATION #
###########################

# Reload all dconf settings
dconf reset -f /

# Set the keyboard layout
setxkbmap fi
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"


###################
# EXECUTE MODULES #
###################

# Do global configuration
source /home/sami/.files/bin/modules/global.sh

# This is a GUI install on an actual PC
source /home/sami/.files/bin/modules/nonvirt.sh

# Get rid of snap
source /home/sami/.files/bin/modules/snap.sh

# Set Spotify theme
source /home/sami/.files/bin/modules/spotify.sh


######################
# CONFIGURE PACKAGES #
######################

# Install additional Gnome packages with apt
sudo apt -y -q install \
gnome-tweak-tool \
rhythmbox \
gitg \
gedit-plugins \
gnome-shell-extensions

# Remove unneeded preinstalled things
sudo apt -y remove firefox firefox-locale-en thunderbird aisleriot gnome-mahjongg gnome-mines gnome-sudoku
rm -rf /home/sami/.mozilla


############################
# CONFIGURE POWER BEHAVIOR #
############################

# Set screen power settings
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true

# Disable autodim
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false

# Disable inactivity suspending
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'


###########################
# SET APPEARANCE SETTINGS #
###########################

# Set themes
gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
dconf write /org/gnome/terminal/legacy/theme-variant "'light'"

# Set dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell favorite-apps []

# Hide Gnome 3 desktop icons (Ubuntu specific)
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri 'file:///home/sami/.wallpaper.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/sami/.wallpaper.jpg'

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 150
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 45
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#262b36', '#9c3528', '#61bc3b', '#f3b43a', '#0d68a8', '#744560', '#288e9c', '#a2a2a2', '#2f343f', '#d64937', '#86df5d', '#fdd75a', '#0f75bd', '#9e5e83', '#37c3d6', '#f9f9f9']"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"

# Change shell theme
killall -3 gnome-shell
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"
killall -3 gnome-shell
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Dark"

################################
# CONFIGURE KEYBOARD SHORTCUTS #
################################

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure terminal hotkey
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/bin/gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>Return'


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public

# Fetch and link Gnome specific dotfiles and configs
ln -sf /home/sami/.files/pic/avatar.jpg /home/sami/.face
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Enable nightlight at night
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Set Nautilus settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'detailed_type', 'size', 'date_modified']

# Show Gnome bar settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true


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
