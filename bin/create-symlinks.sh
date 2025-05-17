#!/bin/bash

# Obtener el directorio de dotfiles
dotfilesDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Enlace simbólico existente
    echo "Eliminando enlace simbólico existente: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Archivo existente
    echo "Creando backup del archivo existente: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Directorio existente
    echo "Creando backup del directorio existente: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creando nuevo enlace simbólico: ${dest}"
  ln -s ${dotfilesDir}/config/${2}/${1} ${dest}
}

# Configuraciones de shell
linkDotfile .aliases "shell"
linkDotfile .bashrc "shell"
linkDotfile .zshrc "shell"

# Configuración de git
linkDotfile .gitconfig "git"
