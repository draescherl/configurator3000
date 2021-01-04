#!/bin/bash

# Run script as root
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Update and upgrade
apt update -y
apt upgrade -y

# TODO
# Add message telling users to verify links (rstudio for example) then ask for confirmation before continuing
# Display message to the user showing progress
# Fix R error message
# Add some colour

# Install font


# Copy .bashrc
cp ./assets/.bashrc /home/$SUDO_USER
source /home/$SUDO_USER/.bashrc

# Install snap store
apt install -y snapd

# General compilers
apt install -y build-essential
apt install -y libssl-dev

# Install NVM and Node.js
git clone https://github.com/nvm-sh/nvm.git /home/$SUDO_USER/.config/nvm
cd /home/$SUDO_USER/.config/nvm
git checkout v0.37.2
. ./nvm.sh
nvm install --lts
nvm use --lts
npm install npm@latest -g
cd -

# Install gedit-tools
apt install gedit-plugins

# Install and configure VSCode
snap install --classic code
code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python
code --install-extension akamud.vscode-theme-onedark
code --install-extension vscode-icons-team.vscode-icons
code --install-extension dusartvict.doc-doxygen
cp ./assets/vscode/settings.json /home/$SUDO_USER/.config/Code/User/
cp ./assets/vscode/c.json /home/$SUDO_USER/.config/Code/User/snippets/

# Install Spotify
snap install spotify

# Install Discord
snap install discord

# Install virtualenv
apt install -y python3-virtualenv

# Install MySQL
apt install -y mysql-server

# Install R and RStudio
#apt install -y apt-transport-https software-properties-common
#add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57\\CBB651716619E084DAB9
#apt update -y
#apt install -y r-base
#apt install -y libclang-dev
#wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb -O assets/rstudio-desktop.deb
#dpkg -i assets/rstudio-desktop.deb

# Reload 
source /home/$SUDO_USER/.bashrc

# Reminders
echo "==================================================================="
echo "Reminders :"
echo "Gedit : Edit > Preferences > Plugins -> Enable Code Comment"
echo "Configure MySQL : sudo mysql_secure_installation"
echo "Start VSCode to configure extensions"
echo "RStudio : Tools > Global Options > Code > Saving > Default text encoding -> UTF-8"
echo "RStudio : Tools > Global Options > General > Basic -> Untick \"Restore Rdata at startup\" and set \"Save workspace to .Rdata on exit\" to never"
echo "RStudio : Tools > Global Options > Appearance -> Set editor theme to Monokai"
echo "RStudio : might want to install some packages"
echo "Run : source ~/.bashrc"