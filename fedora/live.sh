#! /bin/sh

#This shell script configures the dnf.conf file
#and installs gdisk in fedora live boot media.

echo "Adding the following lines to dnf.conf file"
sudo echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf install gdisk -y
