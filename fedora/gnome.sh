#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
gsettings set org.gnome.desktop.interface clock-format "12h"
sudo dnf -y install wget curl vim zsh htop gnome-tweaks util-linux-user papirus-icon-theme gnome-extensions-app arc-theme ranger mc calcurse NetworkManager-wifi NetworkManager-tui brightnessctl pulseaudio-utils powertop sway swaylock waybar cmatrix neofetch https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
mkdir -p $HOME/.config/sway
cp $HOME/Downloads/MyLinux/dotfiles/config/sway/config $HOME/.config/sway/
mkdir -
mkdir -p $HOME/.config/waybar
cp $HOME/Downloads/MyLinux/dotfiles/config/waybar/* $HOME/.config/waybar/
mkdir -p $HOME/.config/alacritty
cp $HOME/Downloads/MyLinux/dotfiles/config/alacritty/* $HOME/.config/alacritty/

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark-solid"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.background picture-uri file://$HOME/Downloads/MyLinux/bg/minimalist01.jpg
gsettings set org.gnome.desktop.background picture-options "stretched"
gsettings set org.gnome.desktop.screensaver picture-uri file://$HOME/Downloads/MyLinux/bg/minimalist01.jpg
gsettings set org.gnome.desktop.screensaver picture-options "stretched"
gsettings set org.gnome.desktop.interface show-battery-percentage false
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts
sh ~/Downloads/PowerlineFonts/install.sh
gsettings set org.gnome.desktop.interface monospace-font-name "DejaVu Sans Mono Book 11"
sudo cp $HOME/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp ~/Downloads/MyLinux/dotfiles/vconsole.conf /etc/vconsole.conf

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
#sed -i '16,17s/^.//' ~/.vimrc
cp ~/Downloads/MyLinux/dotfiles/tmux.conf ~/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc
cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/
git clone https://github.com/joepvd/tty-solarized ~/.oh-my-zsh/custom/plugins/tty-solarized
chsh -s $(which zsh)

