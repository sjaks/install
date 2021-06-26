# .files
# sjaks@github.com

#################################
# INSTALL SPICETIFY AND  THEMES #
#################################

sudo chmod a+wr /usr/share/spotify/
sudo chmod a+wr /usr/share/spotify/Apps -R

curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
mv  /home/sami/spicetify-cli ~/.local/spicetify
git clone https://github.com/morpheusthewhite/spicetify-themes.git
mkdir -p /home/sami/.local/spicetify/Themes
mv spicetify-themes/* /home/sami/.local/spicetify/Themes/
rm -rf spicetify-themes
chmod +x /home/sami/.local/spicetify/spicetify 


#############
# SET THEME #
#############

/home/sami/.local/spicetify/spicetify config current_theme Dracula
/home/sami/.local/spicetify/spicetify backup apply
