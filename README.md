# My Linux dotfiles and install scripts
These work on my machine but might not work on your without major modifications. Use them only as inspiration.

There are scripts for installing these dotfiles for
- Ubuntu with Gnome 3.36 *(finished)*
- Ubuntu Server with i3 *(WIP, experimental)*
- WSL Ubuntu *(WIP, experimental)*

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
