#! /bin/sh

echo on

sudo apt install curl vim zsh rofi gnome-session gnome-shell-extensions font-manager papirus-icon-theme

git clone https://github.com/noobcoder84/Dotfiles ~/Downloads/Dotfiles/

git clone https://github.com/noobcoder84/Saros-theme ~/Downloads/Saros-theme/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts/

git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git ~/Downloads/YosemiteFonts/

cp ~/Downloads/Dotfiles/Ubuntu/zshrc_ubuntu ~/.zshrc

cp ~/Downloads/Dotfiles/Ubuntu/vimrc ~/.vimrc

cd ~/Downloads/Saros-theme/

sh copytotheme.sh

cd ~

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


