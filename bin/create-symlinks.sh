#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/logger.sh"

# Directorio base de los dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Crear enlaces simbólicos
log "Creando enlaces simbólicos..."

# Configuración de shell
ln -sf "${DOTFILES_DIR}/config/shell/.bashrc" "${HOME}/.bashrc"
ln -sf "${DOTFILES_DIR}/config/shell/.zshrc" "${HOME}/.zshrc"
ln -sf "${DOTFILES_DIR}/config/shell/.aliases" "${HOME}/.aliases"

# Configuración de Git
ln -sf "${DOTFILES_DIR}/config/git/.gitconfig" "${HOME}/.gitconfig"

# Configuración de VSCode
mkdir -p "${HOME}/.config/Code/User"
ln -sf "${DOTFILES_DIR}/config/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
ln -sf "${DOTFILES_DIR}/config/vscode/keybindings.json" "${HOME}/.config/Code/User/keybindings.json"

# Configuración de Docker
mkdir -p "${HOME}/.docker"
ln -sf "${DOTFILES_DIR}/config/docker/config.json" "${HOME}/.docker/config.json"

log "Enlaces simbólicos creados correctamente"
