#! /bin/sh

sudo dnf -y install wget curl vim rofi zsh gnome-tweaks util-linux-user papirus-icon-theme

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git ~/Downloads/PowerlineFonts

sh ~/Downloads/PowerlineFonts/install.sh

cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc

vim +PluginInstall +qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc

cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/

chsh -s $(which zsh)

echo Installation complete

echo Please reboot the system

