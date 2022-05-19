#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y groupinstall "KDE Plasma Workspaces"
sudo dnf -y install \
wget \
curl \
vim \
zsh \
tmux \
htop \
util-linux-user \
cmatrix \
neofetch \
cava \
fedora-workstation-repositories \
https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
mediawriter \
sqlite \
latte-dock
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install google-chrome-stable telegram vlc

printf "${yellow}>>>${nc} ${cyan}Installing themes...${nc}\n"
git clone https://github.com/vinceliuice/WhiteSur-kde.git $HOME/Downloads/WhiteSur-kde
sh $HOME/Downloads/WhiteSur-kde/install.sh
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git $HOME/Downloads/WhiteSur-icon-theme
sh $HOME/Downloads/WhiteSur-icon-theme/install.sh -b

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh
sudo cp $HOME/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp $HOME/Downloads/myconfig/dotfiles/vconsole.conf /etc/vconsole.conf
sudo dnf -y install pt-sans-fonts google-noto-kufi-arabic-fonts google-noto-sans-arabic-fonts

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/Downloads/myconfig/dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall
cp $HOME/Downloads/myconfig/dotfiles/tmux.conf $HOME/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp $HOME/Downloads/myconfig/dotfiles/zshrc $HOME/.zshrc
cp $HOME/Downloads/myconfig/omztheme/saros.zsh-theme $HOME/.oh-my-zsh/themes/
chsh -s $(which zsh)

sudo systemctl set-default multi-user.target
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
