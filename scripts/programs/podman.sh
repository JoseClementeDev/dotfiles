#!/bin/bash

# Podman
sudo apt install podman -y

sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER
grep $USER /etc/subuid /etc/subgid

# Podman Compose
sudo apt install python3-pip -y
sudo pip3 install podman-compose

# Test list containers (To create default settings)
podman ps

# Podman configurations
mkdir -p ${HOME}/.config/containers/
ln -s ${HOME}/dotfiles/configs/containers/registries.conf ${HOME}/.config/containers/registries.conf
ln -s ${HOME}/dotfiles/configs/containers/storage.conf ${HOME}/.config/containers/storage.conf

# Podman configurations to use Makefile with alias 'docker-compose'
sudo ln -s /usr/bin/podman /usr/bin/docker
sudo ln -s /usr/local/bin/podman-compose /usr/local/bin/docker-compose
