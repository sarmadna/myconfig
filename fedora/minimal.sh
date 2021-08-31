#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo dnf -y install wget curl vim zsh htop util-linux-user ranger mc calcurse NetworkManager-wifi NetworkManager-tui upower sqlite brightnessctl cmatrix neofetch sway waybar xdg-desktop-portal-wlr pulseaudio-utils net-tools
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install akmod-wl
cp -rf ~/Downloads/MyLinux/dotfiles/config/sway ~/.config
cp -rf ~/Downloads/MyLinux/dotfiles/config/waybar ~/.config
cp -rf ~/Downloads/MyLinux/dotfiles/config/alacritty ~/.config

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts
sh ~/Downloads/PowerlineFonts/install.sh
sudo cp ~/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
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
git clone https://github.com/joepvd/tty-solarized ~/.oh-my-zsh/custom/plugins/
chsh -s $(which zsh)

