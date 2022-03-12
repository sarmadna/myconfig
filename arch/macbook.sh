#!/bin/bash

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting installation script...${nc}\n"
ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
#vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "macbook" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 macbook.localdomain macbook" >> /etc/hosts

printf "${yellow}>>>${nc} ${cyan}Installing packages...${nc}\n"
pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant broadcom-wl dialog bluez bluez-utils firewalld xdg-user-dirs xdg-utils terminus-font gvfs gvfs-afc mtools dosfstools base-devel linux-headers ntfs-3g cups hplip zsh tmux tlp cmatrix neofetch htop

printf "${yellow}>>>${nc} ${cyan}Installing GRUB...${nc}\n"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

printf "${yellow}>>>${nc} ${cyan}Enabling services...${nc}\n"
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable firewalld
systemctl enable cups.service
systemctl enable tlp

printf "${yellow}>>>${nc} ${cyan}Creating user...${nc}\n"
useradd -m sarmad
usermod -aG wheel sarmad
printf "${red}Please change USER password${nc}\n"
passwd sarmad
printf "${red}Please change ROOT password${nc}\n"
passwd
EDITOR=vim visudo
