#! /bin/sh
# Run this script after installing fedora

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Configuring the system...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
echo "Adding the following lines to dnf.conf file"
sudo echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf

printf "${yellow}>>>${nc} ${cyan}Updating the system...${nc}\n"
sudo dnf -y upgrade --refresh

printf "${yellow}>>>${nc} ${cyan}Installing cli apps...${nc}\n"
sudo dnf -y install \
	git \
	vim \
	zsh \
	wget \
	curl \
	htop \
	sqlite \
	cmatrix \
	fastfetch \
	util-linux-user \
	transmission-cli \
	terminus-fonts-console

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
sudo mv /etc/vconsole.conf /etc/vconsole.conf.bak
#sudo cp ../dotfiles/vconsole.conf /etc/vconsole.conf
sudo wget https://sarmadna.github.io/myconfig/dotfiles/vconsole.conf -P /etc/

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
#cp ../dotfiles/vimrc $HOME/.vimrc
wget https://sarmadna.github.io/myconfig/dotfiles/vimrc -P $HOME
mv $HOME/vimrc $HOME/.vimrc
vim +PluginInstall +qall

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#cp ../dotfiles/zshrc $HOME/.zshrc
wget https://sarmadna.github.io/myconfig/dotfiles/zshrc -P $HOME
mv $HOME/zshrc $HOME/.zshrc
chsh -s $(which zsh)

printf "${yellow}>>>${nc} ${red}Done...!${nc}\n"
