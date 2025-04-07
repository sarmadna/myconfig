#! /bin/sh

sudo timedatectl set-ntp true
sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S \
    plasma-desktop \
    dolphin \
    konsole \
    ttf-dejavu \
    firefox \
    gnome-disk-utility \
    papirus-icon-theme

# Nerd font for powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME
sudo mv $HOME/*.ttf /usr/share/fonts

# Setup vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp ../dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../dotfiles/zshrc $HOME/.zshrc
chsh -s $(which zsh)
