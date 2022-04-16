#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
gsettings set org.gnome.desktop.interface clock-format "12h"
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install wget curl vim zsh htop util-linux-user cmatrix neofetch cava gnome-tweaks gnome-extensions-app
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install google-chrome-stable telegram-desktop vlc


printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
git clone https://github.com/vinceliuice/Qogir-theme.git $HOME/Downloads/Qogir-theme
sudo sh $HOME/Downloads/Qogir-theme/install.sh -d /usr/share/themes -l fedora
git clone https://github.com/vinceliuice/Qogir-icon-theme.git $HOME/Downloads/Qogir-icon-theme
sh $HOME/Downloads/Qogir-icon-theme/install.sh
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git $HOME/Downloads/WhiteSur-gtk-theme
sudo sh $HOME/Downloads/WhiteSur-gtk-theme/install.sh -c light -t default
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git $HOME/Downloads/WhiteSur-icon-theme
sh $HOME/Downloads/WhiteSur-icon-theme/install.sh -b
gsettings set org.gnome.desktop.interface gtk-theme "Qogir-dark"
gsettings set org.gnome.desktop.interface icon-theme "Qogir-dark"
gsettings set org.gnome.desktop.background picture-uri file://$HOME/Downloads/MyLinux/bg/minimalist04.jpg
gsettings set org.gnome.desktop.background picture-options "stretched"
gsettings set org.gnome.desktop.screensaver picture-uri file://$HOME/Downloads/MyLinux/bg/minimalist04.jpg
gsettings set org.gnome.desktop.screensaver picture-options "stretched"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh
sudo cp $HOME/Downloads/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp $HOME/Downloads/MyLinux/dotfiles/vconsole.conf /etc/vconsole.conf
sudo dnf -y install pt-sans-fonts google-noto-kufi-arabic-fonts google-noto-sans-arabic-fonts

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

printf "${yellow}>>>${nc} ${cyan}Loading gnome-shell extensions page...${nc}\n"
xdg-open https://extensions.gnome.org/extension/307/dash-to-dock/
xdg-open https://extensions.gnome.org/extension/36/lock-keys/
xdg-open https://extensions.gnome.org/extension/517/caffeine/
xdg-open https://extensions.gnome.org/extension/19/user-themes/
xdg-open https://extensions.gnome.org/extension/7/removable-drive-menu/
xdg-open https://extensions.gnome.org/extension/615/appindicator-support/
