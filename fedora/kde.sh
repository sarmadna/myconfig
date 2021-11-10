#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y install wget curl vim zsh htop util-linux-user cmatrix neofetch https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm fedora-workstation-repositories dnf-plugins-core
sudo dnf config-manager --set-enabled google-chrome
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
git clone https://github.com/vinceliuice/Qogir-icon-theme.git $HOME/Downloads/Qogir-icon-theme
sh $HOME/Downloads/Qogir-icon-theme/install.sh

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh
sudo cp $HOME/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp $HOME/Downloads/MyLinux/dotfiles/vconsole.conf /etc/vconsole.conf

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/Downloads/MyLinux/dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall
cp $HOME/Downloads/MyLinux/dotfiles/tmux.conf $HOME/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp $HOME/Downloads/MyLinux/dotfiles/zshrc $HOME/.zshrc
cp $HOME/Downloads/MyLinux/omztheme/saros.zsh-theme $HOME/.oh-my-zsh/themes/
chsh -s $(which zsh)
