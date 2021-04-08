#! /bin/sh

echo

sudo dnf -y install wget curl vim rofi zsh gnome-tweaks gnome-shell-extension-dash-to-dock powerline-fonts util-linux-user

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ~/Downloads/MyLinux/dotfiles/vimrc ~/.vimrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ~/Downloads/MyLinux/dotfiles/zshrc ~/.zshrc

cp ~/Downloads/MyLinux/omztheme/saros.zsh-theme ~/.oh-my-zsh/themes/

chsh -s $(which zsh)

