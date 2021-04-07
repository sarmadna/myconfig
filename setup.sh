#! /bin/sh

echo

sudo apt install curl vim zsh rofi gnome-session gnome-shell-extensions font-manager papirus-icon-theme libreoffice

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts/

git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git ~/Downloads/YosemiteFonts/

cp ~/Downloads/MyUbuntu/dotfiles/vimrc ~/.vimrc

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# cp ~/Downloads/MyUbuntu/dotfiles/zshrc ~/.zshrc

# cp ~/Downloads/MyUbuntu/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/


