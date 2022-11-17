#!/bin/bash

# Podman
sudo apt install podman -y

sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER
grep $USER /etc/subuid /etc/subgid

# Podman Compose
sudo apt install python3-pip -y
sudo pip3 install podman-compose
