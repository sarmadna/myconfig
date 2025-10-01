#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing apps...${nc}\n"
sudo dnf install -y \
	gnome-disk-utility \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Removing some useless apps...${nc}\n"
sudo dnf remove \
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
	krfb 


printf "${yellow}>>>${nc} ${red}Done...!${nc}\n"

