# My Linux dotfiles and install scripts
These work on my machine but might not work on your without major modifications. Use them only as inspiration.

There are scripts for installing these dotfiles for
- Ubuntu with Gnome 3.36
- Ubuntu Server with i3 *(WIP, experimental)*
- WSL Ubuntu
- Ubuntu Server (for server purposes)

## Gnome notes

### Installing and configuring system

1. Install latest Ubuntu (full install) with LVM and LUKS.
2. Import SSH keys.
```
mkdir /home/sami/.ssh
cp /media/sami/key/edid /home/sami/.ssh/id_ed25519

chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh
chmod 600 /home/sami/.ssh/id_ed25519
```
3. Install git: `sudo apt install git`.
4. Clone this repo: `git clone git@github.com/sjaks/.files.git`.
5. Run `./bin/gnome_install.sh`.

### Additional theming

#### Shell theme
Changing the Gnome shell theme automagically is not possible because to make changes, the user needs to logout.
1. Install Gnome extensions `gnome-shell-extensions`.
2. Reload Gnome Shell: `Alt+F2`, type `r` and press Enter.
3. Enable `User themes` in `gnome-tweak-tool`.
4. Restart `gnome-tweak-tool` and enable the shell theme.


#### Spotify
In order to make Spotify follow the Nord GTK theme, Spicetify-CLI has to be used.
1. Install Spotify using the official .deb:
```
snap remove spotify
wget -O spotify.deb <http://repository.spotify.com/pool/non-free/s/spotify-client/>
sudo dpkg -i spotify.deb
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
```
4. Install Spicetify:
```
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
mv ~/spicetify-cli ~/.local/spicetify
```
3. Fetch the themes:
```
https://github.com/morpheusthewhite/spicetify-themes
git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
mkdir -p ~/.config/spicetify/Themes
cp -r * ~/.config/spicetify/Themes
```
4. Set the theme:
```
./.local/spicetify/spicetify config current_theme Nord
./.local/spicetify/spicetify apply
```

#### Nord colors for Slack
Use this theme string for Slack:
`#2E3440,#3B4252,#88C0D0,#2E3440,#3B4252,#D8DEE9,#A3BE8C,#81A1C1`

## i3 notes

### Installing Ubuntu
1. Download the latest [Ubuntu Server LTS release](https://releases.ubuntu.com/20.04/).  
2. Do the necessary scheiße with the .iso.
3. Do the necessary scheiße in the installer.
4. When partitioning, use automatic partitioning and enable LVM and LUKS.
5. When asked, do **not** install an OpenSSH server
6. Finish the install.
7. [Extend](https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning) the lvm partition.
 

### Importing the dotfiles
1. Import SSH keys.
```
mkdir /home/sami/.ssh
cp /media/sami/key/edid /home/sami/.ssh/id_ed25519

chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh
chmod 600 /home/sami/.ssh/id_ed25519
```
2. Clone this repo: `git clone git@github.com/sjaks/.files.git`.
3. Run `./bin/i3_install.sh`.


## WSL notes
There is a script for configuring a WSL Ubuntu installation. Clone this repo and execute `./bin/wsl_install.sh`.

## Server installation notes
N.B: This script doesn't fully set a server up. Remember to do some security configuration manually.

### Some notes
1. Upload public SSH key
2. Disable root login
3. Disable password login
