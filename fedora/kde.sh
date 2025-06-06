#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing apps...${nc}\n"
sudo dnf -y install \
	plasma-desktop \
	konsole \
	dolphin \
	discover \
	kscreen \
	plasma-nm \
	firefox \
	gnome-abrt \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${red}Done...!${nc}\n"