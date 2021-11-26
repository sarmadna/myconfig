#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y install wget curl vim zsh htop util-linux-user feh polybar picom cmatrix neofetch https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

printf "${yellow}>>>${nc} ${cyan}Configuring i3...${nc}\n"
cp $HOME/Downloads/MyLinux/dotfiles/xres $HOME/.Xresources
cp $HOME/Downloads/MyLinux/dotfiles/i3config $HOME/.config/i3/config
mkdir $HOME/.config/polybar
cp $HOME/Downloads/MyLinux/dotfiles/pbconfig $HOME/.config/polybar/config
cp $HOME/Downloads/MyLinux/dotfiles/pblaunch.sh $HOME/.config/polybar/launch.sh

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
#sed -i '16,17s/^.//' ~/.vimrc
cp $HOME/Downloads/MyLinux/dotfiles/tmux.conf $HOME/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp $HOME/Downloads/MyLinux/dotfiles/zshrc $HOME/.zshrc
cp $HOME/Downloads/MyLinux/omztheme/saros.zsh-theme $HOME/.oh-my-zsh/themes/
chsh -s $(which zsh)
