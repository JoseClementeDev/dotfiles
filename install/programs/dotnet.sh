#!/bin/bash

# Obtener la versión de Ubuntu
UBUNTU_VERSION=$(lsb_release -rs)

# Descargar el paquete de Microsoft según la versión de Ubuntu
wget https://packages.microsoft.com/config/ubuntu/${UBUNTU_VERSION}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update

# Instalar .NET SDK 6.0 y 8.0
sudo apt install -y dotnet-sdk-6.0
sudo apt install -y dotnet-sdk-8.0
