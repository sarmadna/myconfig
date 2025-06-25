#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Configuring the system...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad

printf "${yellow}>>>${nc} ${cyan}Updating the system...${nc}\n"
sudo apt update && sudo apt upgrade -y

printf "${yellow}>>>${nc} ${cyan}Installing cli apps...${nc}\n"
sudo apt -y install \
	ufw \
	vim \
	zsh \
	nala \
	wget \
	curl \
	htop \
	samba \
	sqlite3 \
	cmatrix \
	net-tools \
	screenfetch \
	btrfs-progs

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp ../dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../dotfiles/zshrc $HOME/.zshrc
chsh -s $(which zsh)

printf "${yellow}>>>${nc} ${red}Done...!${nc}\n"