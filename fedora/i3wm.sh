#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
sudo dnf -y install \
wget \
curl \
vim \
zsh \
htop \
util-linux-user \
cmatrix \
neofetch \
sqlite \
Xorg \
xorg-x11-xinit \
i3-gaps \
polybar \
rofi \
firefox \
ranger \
nautilus \
picom \
feh \
https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

printf "${yellow}>>>${nc} ${cyan}Installing powerline fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh
sudo cp $HOME/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp $HOME/Downloads/myconfig/dotfiles/vconsole.conf /etc/vconsole.conf

printf "${yellow}>>>${nc} ${cyan}Configuring i3...${nc}\n"
cp $HOME/Downloads/myconfig/dotfiles/Xresources $HOME/.Xresources
cp $HOME/Downloads/myconfig/dotfiles/xinitrc $HOME/.xinitrc
mkdir -p $HOME/.config/i3
cp $HOME/Downloads/myconfig/dotfiles/i3/config $HOME/.config/i3/config
mkdir $HOME/.config/polybar
cp $HOME/Downloads/myconfig/dotfiles/polybar/config $HOME/.config/polybar/config
cp $HOME/Downloads/myconfig/dotfiles/polybar/launch.sh $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/polybar/launch.sh

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

#echo "if [[ ! \${DISPLAY} && \${XDG_VTNR} == 1 ]]; then" >> $HOME/.zshrc
#echo "    exec startx" >> $HOME/.zshrc
#echo "fi" >> $HOME/.zshrc

printf "${yellow}>>>${nc} ${red}Rebooting in...${nc}\n"
for i in {5..1}
do
  echo $i
  sleep 1
done
reboot
