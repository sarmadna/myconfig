#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archvm" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archvm.localdomain archvm" >> /etc/hosts

pacman -S grub efibootmgr networkmanager firewalld terminus-font xorg plasma plasma-wayland-session

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable firewalld
systemctl enable sddm.service
