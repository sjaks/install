# My Linux dotfiles and install scripts
These work on my machine but might not work on yours without major modifications. Use them only as inspiration.

There are scripts (`bin/`) for installing these dotfiles for
- Ubuntu with the latest Gnome DE
- WSL Ubuntu
- Ubuntu Server

## Gnome notes

### Installing packages and configuring the system

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

#### Nord colors for Slack
Use this theme string for Slack:
`#282A36,#44475A,#44475A,#8BE9FD,#6272A4,#FFFFFF,#50FA7B,#FF55551`
