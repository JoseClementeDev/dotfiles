#!/bin/bash

# Importar utilidades
source "$(dirname "$0")/logger.sh"

# Obtener el directorio de dotfiles
dotfilesDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Función para verificar permisos de ejecución
check_executable() {
    if [ ! -x "$1" ]; then
        error "El script $1 no tiene permisos de ejecución"
        return 1
    fi
    log "✓ Permisos correctos en $1"
    return 0
}

# Función para verificar existencia de archivo
check_file() {
    if [ ! -f "$1" ]; then
        error "El archivo $1 no existe"
        return 1
    fi
    log "✓ Archivo $1 encontrado"
    return 0
}

# Función para verificar existencia de directorio
check_dir() {
    if [ ! -d "$1" ]; then
        error "El directorio $1 no existe"
        return 1
    fi
    log "✓ Directorio $1 encontrado"
    return 0
}

# Verificar estructura de directorios
log "Verificando estructura de directorios..."
check_dir "$dotfilesDir/bin" || exit 1
check_dir "$dotfilesDir/config" || exit 1
check_dir "$dotfilesDir/install" || exit 1
check_dir "$dotfilesDir/install/programs" || exit 1

# Verificar scripts principales
log "Verificando scripts principales..."
check_file "$dotfilesDir/setup.sh" || exit 1
check_executable "$dotfilesDir/setup.sh" || exit 1
check_file "$dotfilesDir/bin/create-symlinks.sh" || exit 1
check_executable "$dotfilesDir/bin/create-symlinks.sh" || exit 1

# Verificar scripts de instalación
log "Verificando scripts de instalación..."
check_file "$dotfilesDir/install/install-apt.sh" || exit 1
check_executable "$dotfilesDir/install/install-apt.sh" || exit 1
check_file "$dotfilesDir/install/install-pip.sh" || exit 1
check_executable "$dotfilesDir/install/install-pip.sh" || exit 1
check_file "$dotfilesDir/install/install-npm.sh" || exit 1
check_executable "$dotfilesDir/install/install-npm.sh" || exit 1

# Verificar scripts de programas
log "Verificando scripts de programas..."
for program in "$dotfilesDir/install/programs"/*.sh; do
    if [ -f "$program" ]; then
        check_executable "$program" || warn "El script $program no tiene permisos de ejecución"
    fi
done

# Verificar archivos de configuración
log "Verificando archivos de configuración..."
check_file "$dotfilesDir/config/shell/.aliases" || exit 1
check_file "$dotfilesDir/config/shell/.bashrc" || exit 1
check_file "$dotfilesDir/config/shell/.zshrc" || exit 1
check_file "$dotfilesDir/config/git/.gitconfig" || exit 1

# Verificar sintaxis de los scripts
log "Verificando sintaxis de los scripts..."
for script in "$dotfilesDir/bin"/*.sh "$dotfilesDir/install"/*.sh "$dotfilesDir/install/programs"/*.sh; do
    if [ -f "$script" ]; then
        if bash -n "$script"; then
            log "✓ Sintaxis correcta en $script"
        else
            error "Error de sintaxis en $script"
            exit 1
        fi
    fi
done

log "¡Todas las pruebas completadas con éxito!"