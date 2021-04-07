#! /bin/sh

echo

sudo apt -y install curl vim rofi gnome-session gnome-shell-extensions font-manager papirus-icon-theme libreoffice vlc zsh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts/

git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git ~/Downloads/YosemiteFonts/

sh ~/Downloads/PowerlineFonts/install.sh

cp ~/Downloads/YosemiteFonts/*.ttf ~/.local/share/fonts/

cp ~/Downloads/MyUbuntu/dotfiles/vimrc ~/.vimrc

wget -v -O ~/Downloads/Zoom.deb https://cdn.zoom.us/prod/5.6.13632.0328/zoom_amd64.deb

wget -v -O ~/Downloads/Telegram.tar.xz https://updates.tdesktop.com/tlinux/tsetup.2.7.1.tar.xz

wget -v -O ~/Downloads/Chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ~/Downloads/MyUbuntu/dotfiles/zshrc ~/.zshrc

cp ~/Downloads/MyUbuntu/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/

chsh -s $(which zsh)

