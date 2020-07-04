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




# INITIALIZE INSTALLATION

# Reload all dconf settings
dconf reset -f /

# Set the keyboard layout
setxkbmap fi
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade




# CONFIGURE PACKAGES

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

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-bindfs

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
ln -sf /home/sami/.files/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/sami/.wallpaper.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/sami/.wallpaper.jpg'

# Set avatar
ln -sf /home/sami/.files/pic/avatar.jpg /home/sami/.face

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 150
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 45
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#2E3436', '#CC0000', '#4E9A06', '#C4A000', '#3465A4', '#75507B', '#06989A', '#D3D7CF', '#555753', '#EF2929', '#8AE234', '#FCE94F', '#729FCF', '#AD7FA8', '#34E2E2', '#EEEEEC']"
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




# CONFIGURE DIRECTORIES AND FILES

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public

# Create an ssh directory
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/atom /home/sami/.atom/config.cson
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden

# Fetch new auto update config
sudo cp /home/sami/.files/rc/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

# Clone vundle and install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null

# Copy keys
cp /media/sami/key/edid /home/sami/.ssh/id_ed25519
chmod 600 /home/sami/.ssh/id_ed25519
ssh-add /home/sami/.ssh/id_ed25519

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
