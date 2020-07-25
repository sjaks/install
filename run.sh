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


# INITIALIZE INSTALLATION

# Set the keyboard layout
setxkbmap fi

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade


# CONFIGURE PACKAGES

# Install packages with apt
sudo apt -y -q install \
i3 \
i3lock \
i3status \
ufw \
neofetch \
unzip \
htop \
gimp \
obs-studio \
catimg \
ccze \
fonts-noto-color-emoji \
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
telegram-desktop

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

# Install vscode extensions
code --install-extension arcticicestudio.nord-visual-studio-code


# CONFIGURE SYSTEM

# Download and set theme
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
mkdir /home/sami/.themes
tar -xvf Nordic-darker.tar.xz -C /home/sami/.themes/
rm Nordic-darker.tar.xz

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public

# Setup directories
mkdir -p /home/sami/.config/Code/User/
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link dotfiles and configs
ln -sf /home/sami/.files/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/gitconfig-work /home/sami/.gitconfig-work
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code/User/settings.json

# Clone vundle and install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null

# Copy keys
cp /media/sami/key/edser /home/sami/.ssh/id_ed25519
chmod 600 /home/sami/.ssh/id_ed25519
ssh-add /home/sami/.ssh/id_ed25519

# Add user to docker group
sudo usermod -aG docker sami


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
