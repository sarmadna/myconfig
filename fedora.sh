#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y install wget curl vim rofi zsh htop gnome-tweaks util-linux-user papirus-icon-theme gnome-extensions-app arc-theme plank plank-docklets arc-theme-plank

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark-solid"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Dark-solid"
gsettings set org.gnome.desktop.background picture-uri file:///home/sarmad/Downloads/MyLinux/bg/fedora.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///home/sarmad/Downloads/MyLinux/bg/fedora.jpg
gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date false
gsettings set org.gnome.desktop.interface monospace-font-name "DejaVu Sans Mono for Powerline Book 11"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
sed -i '16,17s/^.//' ~/.vimrc

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts
sh ~/Downloads/PowerlineFonts/install.sh

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc
cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/
chsh -s $(which zsh)

