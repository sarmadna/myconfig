#! /bin/sh

echo

sudo apt -y install wget curl vim rofi gnome-session gnome-shell-extensions font-manager papirus-icon-theme libreoffice vlc zsh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts

sh ~/Downloads/PowerlineFonts/install.sh

cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc

cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/

chsh -s $(which zsh)
