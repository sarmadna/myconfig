#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y install wget curl vim zsh htop util-linux-user papirus-icon-theme cava arc-theme pulseaudio pavucontrol brightnessctl NetworkManager-wifi iwl6000-firmware iwl6000g2a-firmware iwl6000g2b-firmware network-manager-applet sqlite

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts
sh ~/Downloads/PowerlineFonts/install.sh
#gsettings set org.gnome.desktop.interface monospace-font-name "DejaVu Sans Mono for Powerline Book 11"

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
chsh -s $(which zsh)

