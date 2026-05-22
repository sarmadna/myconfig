#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing apps...${nc}\n"
sudo dnf install -y \
	openrgb \
	gnome-disk-utility \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
# Nerd font for powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME
sudo mv $HOME/*.ttf /usr/share/fonts
# Some RTL fonts
sudo dnf -y install pt-sans-fonts google-noto-kufi-arabic-fonts google-noto-sans-arabic-fonts

printf "${yellow}>>>${nc} ${cyan}Removing some useless apps...${nc}\n"
sudo dnf remove -y \
	akregator \
	kmahjongg \
	kmines \
	kpat \
	kaddressbook \
	kmail \
	dragon \
	elisa-player \
	korganizer \
	kamoso \
	qrca \
	kolourpaint \
	skanpage \
	neochat \
	kde-connect \
	krdc \
	krfb \
	kmouth

printf "${yellow}>>>${nc} ${red}Done!${nc}\n"
