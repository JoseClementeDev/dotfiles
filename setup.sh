#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/bin/logger.sh"

# Verificar requisitos
log "Verificando requisitos del sistema..."

# Verificar si estamos en Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    error "Este script solo funciona en Linux"
fi

# Verificar si tenemos sudo
if ! command -v sudo &>/dev/null; then
    error "sudo no está instalado"
fi

# Verificar si tenemos git
if ! command -v git &>/dev/null; then
    error "git no está instalado"
fi

# Crear backup
log "Creando backup de configuraciones existentes..."
BACKUP_DIR="${HOME}/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Lista de archivos a respaldar
FILES_TO_BACKUP=(
    "${HOME}/.bashrc"
    "${HOME}/.zshrc"
    "${HOME}/.gitconfig"
)

for file in "${FILES_TO_BACKUP[@]}"; do
    if [ -f "$file" ]; then
        cp "$file" "$BACKUP_DIR/"
        log "Backup creado para $file"
    fi
done

# Ejecutar scripts de instalación
log "Instalando configuraciones..."
"$(dirname "$0")/bin/create-symlinks.sh" || error "Error al crear enlaces simbólicos"

log "Instalando paquetes del sistema..."
"$(dirname "$0")/install/install-apt.sh" || error "Error al instalar paquetes del sistema"

log "Instalando programas..."
for program in "$(dirname "$0")/install/programs/"*.sh; do
    log "Instalando $(basename "$program")..."
    "$program" || error "Error al instalar $(basename "$program")"
done

log "Instalando paquetes de Python..."
"$(dirname "$0")/install/install-pip.sh" || error "Error al instalar paquetes de Python"

log "Instalando paquetes de Node..."
"$(dirname "$0")/install/install-npm.sh" || error "Error al instalar paquetes de Node"

# Actualizar sistema
log "Actualizando sistema..."
sudo apt update && sudo apt upgrade -y || error "Error al actualizar el sistema"

# Instalar antigen
log "Instalando antigen..."
curl -L git.io/antigen >~/antigen.zsh || error "Error al instalar antigen"

# Crear directorios de desarrollo
log "Creando directorios de desarrollo..."
mkdir -p ${HOME}/Dev/{examples,personal,projects}

# Mensaje de finalización
if command -v figlet &>/dev/null && command -v lolcat &>/dev/null; then
    figlet "¡Instalación Completada!" | lolcat
else
    log "¡Instalación completada!"
fi

# Cambiar shell a zsh
if command -v zsh &>/dev/null; then
    log "Cambiando shell a zsh..."
    chsh -s $(which zsh)
fi

# Ejecutar zsh al finalizar
exec zsh
