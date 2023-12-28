#!/bin/bash
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update

sudo apt install -y dotnet-sdk-6.0

sudo apt install -y dotnet-sdk-8.0
