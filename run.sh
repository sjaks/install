#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ install
#    |__/
#
# BRIEF:
# Personalized script for configuring
# Linux on my laptop




# CHECK SYSTEM ELIGIBILITY

# Check whether the system is running Ubuntu
distro=$(hostnamectl | grep "Operating System" | awk '{print $3; }')
if [ "$distro" != "Ubuntu" ] ; then
	echo ""
	echo "This script can only be run on Ubuntu. Halting."
	echo ""
	exit 1
fi

# Check whether the system is running Gnome
if [ $(dpkg-query -W -f='${Status}' gnome-terminal 2>/dev/null | grep -c "ok installed") -eq 0 ] ; then
	echo ""
	echo "System is not running Gnome. Halting."
	echo ""
	exit 1
fi




# INITIALIZE INSTALLATION

# Reload all dconf settings
dconf reset -f /

# Set the keyboard layout
setxkbmap fi
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade




# INSTALL PACKAGES

# Install packages with apt
sudo apt -y -q install \
ufw \
neofetch \
unzip \
htop \
catimg \
ccze \
fonts-noto-color-emoji \
pavucontrol \
gnome-tweak-tool \
rhythmbox \
mesa-utils \
vim \
scrot \
curl \
wget \
mlocate \
git \
net-tools \
traceroute \
nmap \
whois \
idn \
texlive-full \
texlive-lang-european \
poedit \
influxdb-client \
gcc \
build-essential \
python3 \
python3-pip \
ruby-dev \
php \
nodejs \
npm \
qt5-default \
qtcreator \
octave \
gitg \
moreutils \
gedit-plugins \
rsync \
entr \
ncdu \
virtualbox \
virtualbox-dkms \
vagrant \
inkscape \
dia \
audacity \
hardinfo \
steam \
cowsay

# Install snap packages
sudo snap install spotify
sudo snap install slack --classic
sudo snap install fast
sudo snap install obs-studio
sudo snap install telegram-desktop
sudo snap install discord
sudo snap install glimpse-editor
sudo snap install shotcut --classic

# Install debs
if [ $(dpkg-query -W -f='${Status}' google-chrome-stable 2>/dev/null | grep -c "ok installed") -eq 0 ] ; then
	# Fetch the Chrome binary and install it together with its dependencies
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo apt -y install -f
	rm google-chrome-stable_current_amd64.deb
fi

if [ $(dpkg-query -W -f='${Status}' atom 2>/dev/null | grep -c "ok installed") -eq 0 ] ; then
	# Fetch the Atom binary and install it together with its dependencies
	wget -O atom.deb https://atom.io/download/deb
	sudo dpkg -i atom.deb
	sudo apt -y install -f
	rm atom.deb
fi

# Install atom extensions
apm install solarized-one-light-ui # ui theme
apm install atom-file-icons
apm install busy-signal
apm install ide-html
apm install ide-python
apm install intentions
apm install javascript-snippets
apm install linter
apm install linter-phpcs
apm install linter-ui-default
apm install php-integrator-autocomplete-plus
apm install pp-markdown

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-bindfs




# REMOVE PREINSTALLED PACKAGES

# Remove Mozilla packages and default Gnome games
sudo apt -y remove firefox thunderbird aisleriot gnome-mahjongg gnome-mines gnome-sudoku
rm -rf /home/sami/.mozilla




# CONFIGURE POWER BEHAVIOR

# Make the computer screen not turn off automatically but
# make it ask for a password when woken up from suspension
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true

# Disable inactivity suspending
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'




# SET APPEARANCE SETTINGS

# Set themes
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

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
ln -sf /home/sami/install/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/sami/.wallpaper.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/sami/.wallpaper.jpg'

# Set avatar
ln -sf /home/sami/install/pic/avatar.jpg /home/sami/.face

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 150
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 45
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color 'rgb(253,246,227)'
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color '#657A81'
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(101,123,131)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(147,161,161)']"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"





# CONFIGURE KEYBOARD SHORTCUTS

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure terminal hotkey
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/bin/gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>Return'




# DO ADDITIONAL CONFIGURATION

# Enable nightlight at night
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Set Nautilus view
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"

# Disable Nautilus history
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Make Nautilus show directories first
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# Set Nautilus columns
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'detailed_type', 'size', 'date_modified']

# Show week numbers in calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Show battery percentage in Gnome shell
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Set Gedit settings
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.plugins active-plugins "['codecomment', 'bracketcompletion', 'terminal', 'colorpicker', 'docinfo', 'spell', 'filebrowser', 'time', 'quickhighlight', 'modelines', 'drawspaces', 'wordcompletion', 'git']"
gsettings set org.gnome.gedit.preferences.editor highlight-current-line false
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-light'
gsettings set org.gnome.gedit.preferences.editor auto-indent true




# CONFIGURE DIRECTORIES AND FILES

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public

# Create an ssh directory
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Create atom config dir
mkdir -p /home/sami/.atom

# Fetch and link dotfiles and configs
ln -sf /home/sami/install/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/install/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/install/rc/atom /home/sami/.atom/config.cson
ln -sf /home/sami/install/rc/profile /home/sami/.profile
ln -sf /home/sami/install/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/install/rc/hidden /home/sami/.hidden

# Fetch new auto update config
sudo cp /home/sami/install/rc/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

# Clone vundle and install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null

# Copy keys
cp /media/sami/key/edid /home/sami/.ssh/edid
chmod 600 /home/sami/.ssh/edid
ssh-add /home/sami/.ssh/edid
gpg --import /media/sami/key/pgp.asc

# Remove temporary files
rm -rf /home/sami/.cache/*
rm /home/sami/.bash_history
rm /home/sami/.python_history
rm /home/sami/.viminfo
rm /home/sami/.wget-hsts




# FINAL STEPS

# Enable firewall
sudo ufw enable

# Clear apt cache
sudo apt -y autoclean
sudo apt -y autoremove




# FINISH

clear
echo ""
echo "  The script has finished running."
echo ""
