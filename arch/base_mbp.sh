#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "macbook" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 macbook.localdomain macbook" >> /etc/hosts

pacman -S grub efibootmgr networkmanager network-manager-applet wpa_supplicant broadcom-wl dialog firewalld bluez bluez-utils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack xdg-user-dirs xdg-utils terminus-font gvfs mtools base-devel ntfs-3g cups hplip zsh tmux tlp cmatrix

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable firewalld
systemctl enable cups.service
systemctl enable bluetooth

useradd -m sarmad

echo "PLEASE CHANGE USER PASSWORD"
passwd sarmad

echo "PLEASE CHANGE ROOT PASSWORD"
passwd

EDITOR=vim visudo
