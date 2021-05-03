#! /bin/sh

yellow='\033[1;33m'

cyan='\033[1;36m'

nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"

sudo dnf -y install wget curl vim rofi zsh htop gnome-tweaks util-linux-user papirus-icon-theme gnome-extensions-app arc-theme plank plank-docklets arc-theme-plank

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"

printf "${yellow}>>>${nc} ${cyan}Setting desktop and lockscreen background...${nc}\n"
gsettings set org.gnome.desktop.background picture-uri file:///home/sarmad/Downloads/MyLinux/bg/fedora.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///home/sarmad/Downloads/MyLinux/bg/fedora.jpg

printf "${yellow}>>>${nc} ${cyan}Installing Vundle.vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts
sh ~/Downloads/PowerlineFonts/install.sh

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc
cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/
chsh -s $(which zsh)

