#       _       _
#  ___ (_) __ _| | _____  sjaks@github
# / __|| |/ _` | |/ / __| jaks.fi
# \__ \| | (_| |   <\__ \ ------------
# |___// |\__,_|_|\_\___/ .files
#    |__/
#
# BRIEF:
# Personalized script for configuring
# my Linux machines
#
# Major bug with LVM in the live server .iso:
# https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning


# INITIALIZE INSTALLATION

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade


# CONFIGURE PACKAGES

# Install packages with apt
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
ufw \
neofetch \
unzip \
htop \
gimp \
imagemagick \
obs-studio \
catimg \
ccze \
fonts-noto-color-emoji \
lxappearance \
papirus-icon-theme \
pavucontrol \
mplayer \
mpv \
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
texlive-latex-recommended \
texlive-lang-european \
poedit \
influxdb-client \
gcc \
build-essential \
python3 \
python3-pip \
flake8 \
ruby-dev \
php \
nodejs \
npm \
qt5-default \
octave \
moreutils \
rsync \
entr \
ncdu \
virtualbox \
virtualbox-dkms \
vagrant \
docker \
docker-compose \
inkscape \
dia \
audacity \
hardinfo \
xbacklight \
blueman \
telegram-desktop


# Fetch the Chrome binary and install it together with its dependencies
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo apt -y install -f

# Install snaps
sudo snap install code --classic
sudo snap install spotify
sudo snap install slack --classic

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-bindfs

# Install vscode extensions
code --install-extension arcticicestudio.nord-visual-studio-code

# Install mons
cd /home/sami/Documents && git clone --recursive https://github.com/Ventto/mons.git
cd mons/ && sudo make install && cd /home/sami/.files


# CONFIGURE SYSTEM

# Download theme (set manually with lxappearance)
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
mkdir /home/sami/.themes
tar -xvf Nordic-darker.tar.xz -C /home/sami/.themes/
rm Nordic-darker.tar.xz

# Setup directories
mkdir /home/sami/Documents/
mkdir /home/sami/Downloads/
mkdir -p /home/sami/.config/i3/
mkdir -p /home/sami/.config/Code/User/
mkdir -p /home/sami/.config/dunst
rm -rf /home/sami/Templates
rm -rf /home/sami/Public

# Fetch and link dotfiles and configs
ln -sf /home/sami/.files/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
ln -sf /home/sami/.files/rc/xinitrc /home/sami/.xinitrc
ln -sf /home/sami/.files/rc/xresources /home/sami/.Xresources
ln -sf /home/sami/.files/rc/i3 /home/sami/.config/i3/config
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/dunstrc /home/sami/.config/dunst/dunstrc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/gitconfig-work /home/sami/.gitconfig-work
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code/User/settings.json

# Clone vundle and install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null

# Add user to groups
sudo usermod -aG docker sami

# Add systemd config
echo HandleLidSwitch=lock | sudo tee -a /etc/systemd/logind.conf
sudo systemctl daemon-reload
sudo systemctl disable systemd-networkd-wait-online
sudo systemctl mask systemd-networkd-wait-online


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
