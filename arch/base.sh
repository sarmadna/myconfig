#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
green='\033[1;32m'
nc='\033[0m'

echo "Enter host name: "
read hostName
echo "Enter first name: "
read firstName
echo "Enter last name: "
read lastName
echo "Enter username: "
read userName
echo "Enter new password: "
read passWord

function confirm() {
    while true; do
        echo "$hostName:$firstName:$lastName:$userName:$passWord"
        read -p "Do you want to proceed? (YES/NO/CANCEL) " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            [Cc]* ) exit;;
            * ) echo "Please answer YES, NO, or CANCEL.";;
        esac
    done
}

if confirm; then
    printf "${yellow}>>>${nc} ${cyan}Configuring the system...${nc}\n"
    ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
    hwclock --systohc
    #sed -i '171s/.//' /etc/locale.gen
    locale-gen
    echo "LANG=en_US.UTF-8" >> /etc/locale.conf
    echo "$hostName" >> /etc/hostname
    echo "127.0.0.1 localhost" >> /etc/hosts
    echo "::1       localhost" >> /etc/hosts
    echo "127.0.1.1 $hostName.localdomain $hostName" >> /etc/hosts
    #sed -i '37s/^.//' /etc/pacman.conf
    #cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    #relfector -l 5 -c "" --sort rate --save /etc/pacman.d/mirrorlist

    printf "${yellow}>>>${nc} ${cyan}Installing packages...${nc}\n"
    pacman -S \
        grub \
        os-prober \
        efibootmgr \
        dialog \
        networkmanager \
        wpa_supplicant \
        network-manager-applet \
        firewalld \
        bluez \
        bluez-utils \
        base-devel \
        linux-headers \
        xdg-user-dirs \
        xdg-utils \
        mtools \
        dosfstools \
        ntfs-3g \
        gvfs \
        gvfs-smb \
        zram-generator \
        pipewire \
        pipewire-alsa \
        pipewire-pulse \
        pipewire-jack \
        acpi \
        acpid \
        acpi_call \
        zsh \
        wget \
        curl \
        htop \
        flatpak \
        cmatrix \
        neofetch \
        terminus-font

    printf "${yellow}>>>${nc} ${cyan}Setting up zram swap...${nc}\n"
    echo "[zram0]" > /etc/systemd/zram-generator.conf
    echo "zram-size = ram" >> /etc/systemd/zram-generator.conf
    echo "compression-algorithm = zstd" >> /etc/systemd/zram-generator.conf
    echo "swap-priority = 100" >> /etc/systemd/zram-generator.conf
    echo "fs-type = swap" >> /etc/systemd/zram-generator.conf

    printf "${yellow}>>>${nc} ${cyan}Enabling services...${nc}\n"
    systemctl enable NetworkManager
    systemctl enable fstrim.timer
    systemctl enable firewalld
    systemctl enable acpid
    systemctl enable systemd-resolved
    #systemctl enable bluetooth
    
    printf "${yellow}>>>${nc} ${cyan}Setting up bootloader...${nc}\n"
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg

    printf "${yellow}>>>${nc} ${cyan}Creating user...${nc}\n"
    # Set console font
    echo "FONT=ter-v18n" >> /etc/vconsole.conf
    # Please change the username and the password accordingly
    useradd -m -c "$firstName $lastName" $userName
    echo $userName:$passWord | chpasswd
    echo "$userName ALL=(ALL) ALL" >> /etc/sudoers.d/$userName
    # Disable ROOT account
    passwd -l root

    printf "${yellow}>>>${nc} ${green}Done...!${nc}\n"

else
    printf "${yellow}>>>${nc} ${red}Aborting...!${nc}\n"
    printf "${yellow}>>>${nc} ${red}Please restart the script!${nc}\n"
fi
