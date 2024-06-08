#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install wget
install curl
install zip
install unzip
install zsh
# install fzf
install bat
install eza
install ripgrep
install openjdk-11-jdk

# Fun stuff
install figlet
install lolcat
