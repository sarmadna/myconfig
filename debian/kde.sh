#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing apps...${nc}\n"
sudo nala install -y \
	gnome-disk-utility \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
# Nerd font for powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME
sudo mv $HOME/*.ttf /usr/share/fonts

sudo nala remove -y \
    dragonplayer \
    juk \
    akregator \
    kaddressbook \
    kmail \
    kdeconnect \
    korganizer
    