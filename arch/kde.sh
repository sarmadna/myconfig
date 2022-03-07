#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant firewalld terminus-font xorg gvfs mtools bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack xdg-user-dirs xdg-utils xorg plasma plasma-wayland-session kde-applications sddm

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable firewalld
systemctl enable sddm
systemctl enable cups
systemctl enable bluetooth
