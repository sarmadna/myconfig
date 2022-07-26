#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
gsettings set org.gnome.desktop.interface clock-format "12h"
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install \
vim \
zsh \
wget \
curl \
htop \
cava \
cmatrix \
neofetch \
gnome-tweaks \
util-linux-user \
gnome-extensions-app \
#gnome-shell-extension-caffeine \
#gnome-shell-extension-user-theme \
#gnome-shell-extension-drive-menu \
#gnome-shell-extension-appindicator \
#gnome-shell-extension-dash-to-dock \
https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install google-chrome-stable telegram-desktop vlc

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git $HOME/Downloads/WhiteSur-icon-theme
sh $HOME/Downloads/WhiteSur-icon-theme/install.sh -b
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

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

#printf "${yellow}>>>${nc} ${cyan}Loading gnome-shell extensions page...${nc}\n"
#xdg-open https://extensions.gnome.org/extension/36/lock-keys/
#xdg-open https://extensions.gnome.org/extension/517/caffeine/
#xdg-open https://extensions.gnome.org/extension/19/user-themes/
#xdg-open https://extensions.gnome.org/extension/7/removable-drive-menu/
#xdg-open https://extensions.gnome.org/extension/615/appindicator-support/

printf "${yellow}>>>${nc} ${cyan}Please install the following gs extensions...${nc}\n
https://extensions.gnome.org/extension/36/lock-keys/\n
https://extensions.gnome.org/extension/517/caffeine/\n
https://extensions.gnome.org/extension/19/user-themes/\n
https://extensions.gnome.org/extension/7/removable-drive-menu/\n
https://extensions.gnome.org/extension/615/appindicator-support/\n
https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/\n"

