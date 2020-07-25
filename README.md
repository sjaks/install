# My Linux dotfiles and install scripts
These work on my machine but might not work on your without major modifications. Use them only as inspiration.

## Reinstallation notes

### Installing the OS
1. Download the latest [Ubuntu Server LTS release](https://releases.ubuntu.com/20.04/).  
2. Do the necessary scheiße with the .iso.
3. Do the necessary scheiße in the installer.
4. When partitioning, use automatic partitioning and enable LVM and LUKS.
5. When asked, do **not** install an OpenSSH server
6. Finish the install.

### Importing the dotfiles
1. Import SSH keys and install git `sudo apt install git`.
```
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh
cp /media/sami/key/edid /home/sami/.ssh/id_ed25519
chmod 600 /home/sami/.ssh/id_ed25519
ssh-add /home/sami/.ssh/id_ed25519
```
2. Clone this repo: `cd ~ && git clone git@github.com/sjaks/.files.git.
3. Make links to the dotfiles:
```
mkdir -p /home/sami/.config/Code/User/

ln -sf /home/sami/.files/pic/wallpaper.jpg /home/sami/.wallpaper.jpg
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/vimrc /home/sami/.vimrc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/gitconfig-work /home/sami/.gitconfig-work
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code/User/settings.json
```
4. Configure vim:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall > /dev/null
```

### Do more manual configuration
1. Add user to docker group `sudo usermod -aG docker sami`.
2. Install GTK theme:
```
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
mkdir /home/sami/.themes
tar -xvf Nordic-darker.tar.xz -C /home/sami/.themes/
rm Nordic-darker.tar.xz
```
3. Set the theme with `lxappearance`.
