#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Starting post-installation script...${nc}\n"
sudo pacman -S xorg gnome firefox telegram-desktop
sudo systemctl enable gdm
cd $HOME/Downloads/
git clone https://aur.archlinux.org/yay.git
cd $HOME/Downloads/yay/
makepkg -si
yay -S google-chrome
yay -S chrome-gnome-shell
yay -S zramd
sudo systemctl enable zramd

printf "${yellow}>>>${nc} ${cyan}Applying theme...${nc}\n"
git clone https://github.com/vinceliuice/Qogir-theme.git $HOME/Downloads/Qogir-theme
sudo sh $HOME/Downloads/Qogir-theme/install.sh -d /usr/share/themes -l arch
git clone https://github.com/vinceliuice/Qogir-icon-theme.git $HOME/Downloads/Qogir-icon-theme
sh $HOME/Downloads/Qogir-icon-theme/install.sh
gsettings set org.gnome.desktop.interface clock-format "12h"
gsettings set org.gnome.desktop.interface gtk-theme "Qogir-dark"
gsettings set org.gnome.desktop.interface icon-theme "Qogir-dark"
gsettings set org.gnome.desktop.background picture-uri file://$HOME/Downloads/myconfig/bg/minimalist04.jpg
gsettings set org.gnome.desktop.background picture-options "stretched"
gsettings set org.gnome.desktop.screensaver picture-uri file://$HOME/Downloads/myconfig/bg/minimalist04.jpg
gsettings set org.gnome.desktop.screensaver picture-options "stretched"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ara'), ('xkb', 'iq+ku_ara')]"

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
git clone https://github.com/powerline/fonts.git $HOME/Downloads/PowerlineFonts
sh $HOME/Downloads/PowerlineFonts/install.sh

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

printf "${yellow}>>>${nc} ${cyan}Loading gnome-shell extensions page...${nc}\n"
#xdg-open https://extensions.gnome.org/extension/307/dash-to-dock/
#xdg-open https://extensions.gnome.org/extension/36/lock-keys/
#xdg-open https://extensions.gnome.org/extension/517/caffeine/
#xdg-open https://extensions.gnome.org/extension/4099/no-overview/
#xdg-open https://extensions.gnome.org/extension/19/user-themes/
