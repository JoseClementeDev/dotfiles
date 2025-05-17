#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../bin/logger.sh"

# Verificar si pip está instalado
if ! command -v pip3 &> /dev/null; then
    error "pip3 no está instalado"
fi

# Instalar checkov
log "Instalando checkov..."
pip3 install checkov || error "Error al instalar checkov"

log "Instalación de checkov completada"
