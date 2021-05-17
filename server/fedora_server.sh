#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo dnf -y install wget curl vim zsh htop util-linux-user cups hplip samba

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
#sed -i '16,17s/^.//' ~/.vimrc
cp ~/Downloads/MyLinux/dotfiles/tmux.conf ~/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/Downloads/MyLinux/server/zshrc_server ~/.zshrc
cp ~/Downloads/MyLinux/server/saros.zsh-theme ~/.oh-my-zsh/themes/
chsh -s $(which zsh)

