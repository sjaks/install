# .files
# sjaks@github.com

###################
# GET RID OF SNAP #
###################

# Remove preinstalled snaps
sudo snap remove snap-store
sudo snap remove gtk-common-themes
sudo snap remove gnome-3-34-1804
sudo snap remove gnome-3-28-1804
sudo snap remove core18

# Remove snapd itself
sudo apt -y purge snapd

# Delete snap directories
rm -rf ~/snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

# Prevent automatic instal of snapd
sudo apt-mark hold snapd
