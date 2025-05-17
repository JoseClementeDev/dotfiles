#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../../bin/logger.sh"

# =======================
# Install Node with fnm
# =======================

# Instalar fnm (Fast Node Manager)
log "Instalando fnm..."
curl -fsSL https://fnm.vercel.app/install | bash || error "Error al instalar fnm"

# Configurar fnm
log "Configurando fnm..."
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# Instalar Node.js LTS
log "Instalando Node.js LTS..."
fnm install --lts || error "Error al instalar Node.js LTS"

# Usar Node.js LTS por defecto
log "Configurando Node.js LTS como versión por defecto..."
fnm use --lts || error "Error al configurar Node.js LTS"

log "Instalación de Node.js completada"
