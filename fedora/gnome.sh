#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing apps...${nc}\n"
sudo dnf -y install \
	gnome-tweaks \
	papirus-icon-theme \
	gnome-extensions-app

printf "${yellow}>>>${nc} ${cyan}Removing packages...${nc}\n"
sudo dnf -y remove \
	gnome-shell-extension-apps-menu \
	gnome-shell-extension-background-logo

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

printf "${yellow}>>>${nc} ${red}Done...!${nc}\n"
