# .files
# sjaks@github.com


######################
# CONFIGURE PACKAGES #
######################

# Update the repositories and execute a full upgrade
sudo apt -q update
sudo apt -y -q dist-upgrade

# Install global packages used on all machines
sudo apt -y -q install \
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
ln -sf /home/sami/.files/rc/bash_logout /home/sami/.bash_logout
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc

# Load vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null
