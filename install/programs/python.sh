#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../../bin/logger.sh"

# Instalar Python y herramientas básicas
log "Instalando Python y herramientas básicas..."
sudo apt install -y python3-venv python3-pip python3-full pipx || error "Error al instalar Python y herramientas básicas"

# Configurar pipx
log "Configurando pipx..."
python3 -m pipx ensurepath || error "Error al configurar pipx"

# Crear y activar entorno virtual para paquetes
log "Creando entorno virtual para paquetes Python..."
python3 -m venv ~/.venv || error "Error al crear entorno virtual"
source ~/.venv/bin/activate || error "Error al activar entorno virtual"

# Instalar paquetes de Python en el entorno virtual
log "Instalando paquetes de Python..."
pip install Django || error "Error al instalar Django"

# Desactivar entorno virtual
deactivate

log "Instalación de Python completada"
