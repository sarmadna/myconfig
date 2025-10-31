# MyConfig

## Introduction

This repo contains script files that handle post-installation tasks and install the apps that I would like to use on my PC.

## Linux post-installation tasks

* Install apps
* Setup vim and vundle
* Get some fonts
* Copy dotfiles to home directory
* Install oh-my-zsh

## Install MyConfig

You can run the scripts using either `git` or `wget`.

### Using `git`:

Clone the repo to your home directory.
~~~
git clone https://github.com/sarmadna/myconfig.git ~/myconfig
~~~

Navigate to `myconfig/fedora`

First run the `base.sh` script to install the basic apps

Then run the other scripts depending on the DE you use like `gnome.sh` or  `kde.sh`

### Using `wget`:

Download the script file fist
~~~
wget https://sarmadna.github.io/myconfig/fedora/base.sh
~~~
Then run the script 
~~~
sh base.sh
~~~
