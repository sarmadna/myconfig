#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo pacman -S xorg plasma plasma-wayland-session firefox libreoffice-fresh kde-applications papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh

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
