#!/bin/bash

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Función para logging
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}" >&2
    exit 1
}

# Verificar requisitos
check_requirements() {
    log "Verificando requisitos..."

    # Verificar si estamos en Linux
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        error "Este script solo funciona en Linux"
    fi

    # Verificar si tenemos sudo
    if ! command -v sudo &> /dev/null; then
        error "sudo no está instalado"
    fi

    # Verificar si tenemos git
    if ! command -v git &> /dev/null; then
        error "git no está instalado"
    fi
}

# Crear backup
create_backup() {
    log "Creando backup de configuraciones existentes..."
    BACKUP_DIR="${HOME}/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"

    # Lista de archivos a respaldar
    FILES_TO_BACKUP=(
        "${HOME}/.bashrc"
        "${HOME}/.zshrc"
        "${HOME}/.vimrc"
        "${HOME}/.gitconfig"
    )

    for file in "${FILES_TO_BACKUP[@]}"; do
        if [ -f "$file" ]; then
            cp "$file" "$BACKUP_DIR/"
            log "Backup creado para $file"
        fi
    done
}

# Función principal
main() {
    log "Iniciando instalación de dotfiles..."

    # Verificar requisitos
    check_requirements

    # Crear backup
    create_backup

    # Ejecutar scripts de instalación
    log "Instalando configuraciones..."
    ./scripts/symlink.sh || error "Error en symlink.sh"

    log "Instalando paquetes apt..."
    ./scripts/aptinstall.sh || error "Error en aptinstall.sh"

    log "Instalando programas..."
    ./scripts/programs.sh || error "Error en programs.sh"

    log "Instalando paquetes pip..."
    ./scripts/pipinstall.sh || error "Error en pipinstall.sh"

    # Actualizar sistema
    log "Actualizando sistema..."
    sudo apt update && sudo apt upgrade -y || error "Error al actualizar sistema"

    # Instalar antigen
    log "Instalando antigen..."
    curl -L git.io/antigen > ~/antigen.zsh || error "Error al instalar antigen"

    # Crear directorios de desarrollo
    log "Creando directorios de desarrollo..."
    mkdir -p ${HOME}/Dev/{examples,personal,projects}

    # Mensaje de finalización
    if command -v figlet &> /dev/null && command -v lolcat &> /dev/null; then
        figlet "¡Instalación Completada!" | lolcat
    else
        log "¡Instalación completada!"
    fi

    # Cambiar shell a zsh
    if command -v zsh &> /dev/null; then
        log "Cambiando shell a zsh..."
        chsh -s $(which zsh)
    fi
}

# Ejecutar script principal
main
