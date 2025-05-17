#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../../bin/logger.sh"

# Instalar Python y herramientas básicas
log "Instalando Python y herramientas básicas..."
sudo apt install -y python3-venv python3-pip || error "Error al instalar Python y herramientas básicas"

# Instalar paquetes de Python
log "Instalando paquetes de Python..."
pip3 install Django || error "Error al instalar Django"

log "Instalación de Python completada"
