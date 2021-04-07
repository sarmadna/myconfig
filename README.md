# My Ubuntu 

## Introduction

Hello 

The `setup.sh` handles post-installation tasks and installs the apps that I would like to use on my PC. I am currently on Ubuntu 20.04 LTS. More details on the tasks are described below.

## Ubuntu post-installation tasks

* Install terminal apps `curl` `vim` `zsh` etc.
* Install GUI apps `libreoffice` `vlc`
* Install GUI tweaks `papirus-icon-theme` `gnome-session` `gnome-shell-extensions`
* Get `vundle`
* Get Powerline fonts
* Get Yosemite fonts
* Copy dotfiles to home directory
* Install oh-my-zsh
* Create keyboard shortcut for rofi (this is done manually because I don't know how to write a script to do this automatically)

## Install My Ubuntu

### Requirements

Please install `git` first if it is not installed already.
~~~
sudo apt install git
~~~

### Installation

Clone the repo to your downloads directory.
~~~
git clone https://github.com/noobcoder84/myubuntu.git ~/Downloads/MyUbuntu/
~~~

Then navigate to `myubuntu` folder and run the script.
~~~
sh setup.sh
~~~

### Rofi Configuration

Create a new keyboard shortcut

Add the following line

rofi -show drun -show-icons -lines 10 -font "SFNS Display 14"



