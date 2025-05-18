#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../bin/logger.sh"

# Verificar si pipx está instalado
if ! command -v pipx &>/dev/null; then
    error "pipx no está instalado"
fi

# Instalar checkov usando pipx
log "Instalando checkov..."
pipx install checkov || error "Error al instalar checkov"

log "Instalación de checkov completada"

# Asegurar que ~/.local/bin esté en el PATH
log "Asegurando que ~/.local/bin esté en el PATH..."
pipx ensurepath || error "Error al asegurar el PATH para pipx"
