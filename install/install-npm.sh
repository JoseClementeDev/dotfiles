#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/../bin/logger.sh"

# Verificar si npm está instalado
if ! command -v npm &> /dev/null; then
    error "npm no está instalado"
fi

# Instalar commitlint
log "Instalando commitlint..."
npm install -g @commitlint/cli @commitlint/config-conventional || error "Error al instalar commitlint"

# Crear configuración de commitlint
log "Creando configuración de commitlint..."
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js || error "Error al crear commitlint.config.js"

# Verificar instalación
log "Verificando instalación de commitlint..."
echo 'foo: bar' | commitlint || warn "La verificación de commitlint falló"

log "Instalación de paquetes npm completada"
