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
install zsh
install fzf
install bat
install exa
install ripgrep
# install awscli
install openjdk-11-jdk
# install dotnet-sdk-6.0

# Fun stuff
install figlet
install lolcat
