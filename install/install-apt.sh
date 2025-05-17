#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../bin/logger.sh"

# Verificar si tenemos sudo
if ! command -v sudo &> /dev/null; then
    error "sudo no está instalado"
fi

# Actualizar repositorios
log "Actualizando repositorios..."
sudo apt update || error "Error al actualizar repositorios"

function install {
    if ! command -v $1 &> /dev/null; then
        log "Instalando: ${1}..."
        sudo apt install -y $1 || error "Error al instalar ${1}"
    else
        log "Ya instalado: ${1}"
    fi
}

# Herramientas básicas
log "Instalando herramientas básicas..."
install wget
install curl
install zip
install unzip
install zsh
# install fzf
install bat
# install eza
install ripgrep
install openjdk-11-jdk

# Herramientas de desarrollo
log "Instalando herramientas de desarrollo..."
install git
install build-essential

# Herramientas de utilidad
log "Instalando herramientas de utilidad..."
install figlet
install lolcat

log "Instalación de paquetes apt completada"
