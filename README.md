# MyConfig


## Introduction

Hello 

The script files handle post-installation tasks and install the apps that I would like to use on my PC. More details on the tasks are described below.

## Linux post-installation tasks

* Install terminal apps `vim` `zsh` etc.
* Install GUI tweaks
* Setup vim and vundle
* Get Powerline fonts
* Copy dotfiles to home directory
* Install oh-my-zsh
* Create keyboard shortcut for rofi (this is done manually because I don't know how to write a script to do this automatically)

## Install MyConfig

### Requirements

Please install `git` first if it is not installed already.

### Installation

Clone the repo to your downloads directory.
~~~
git clone https://github.com/sarmadna/mylinux.git ~/Downloads/myconfig
~~~

Then navigate to `myconfig`` folder and run the script.

For Fedora, navigate to `fedora` folder and then execute the script;
~~~
sh gnome.sh
~~~

### Rofi Configuration

(works only on X11)

Create a new keyboard shortcut

Add the following line
~~~
rofi -show drun -show-icons -lines 10 -font "Cantarell Regular 11"
~~~
