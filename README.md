# Dotfiles

Mi configuración personal de dotfiles para Linux. Una colección de scripts y configuraciones que utilizo para configurar mi entorno de desarrollo.

Siéntete libre de:
- Hacer un fork para crear tu propia versión
- Usarlo como referencia para crear tus propios dotfiles
- Tomar ideas y adaptarlas a tus necesidades

## 🚀 Características

- Configuración de shell (ZSH con Antigen y Oh-My-Zsh)
- Configuraciones de Git con alias útiles
- Scripts de instalación automatizados
- Gestión de paquetes (apt, pip, npm)
- Alias útiles para:
  - Docker y Docker Compose
  - Git
  - Navegación de directorios
  - Desarrollo con .NET y Node.js

## 🛠️ Herramientas Instaladas

| Herramienta | Versión | Descripción |
|------------|---------|-------------|
| [Docker](https://www.docker.com) | Latest | Plataforma de contenedores para crear, desplegar y ejecutar aplicaciones de forma aislada |
| [Node.js](https://nodejs.org) | LTS | Entorno de ejecución para JavaScript |
| [Python](https://www.python.org) | 3.x | Lenguaje de programación de alto nivel, interpretado y multiparadigma |
| [.NET](https://dotnet.microsoft.com) | 6.0, 8.0 | Framework open source para desarrollo de aplicaciones multiplataforma |
| [AWS CLI](https://aws.amazon.com/cli) | v2 | Interfaz de línea de comandos para AWS |
| [k6](https://k6.io) | Latest | Herramienta de pruebas de carga |
| [bat](https://github.com/sharkdp/bat) | Latest | Mejor alternativa a cat con sintaxis highlighting |
| [eza](https://github.com/eza-community/eza) | Latest | Mejor alternativa a ls con más características |
| [fzf](https://github.com/junegunn/fzf) | Latest | Búsqueda fuzzy en línea de comandos |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Latest | Búsqueda rápida de texto |
| [figlet](https://github.com/cmatsuoka/figlet) | Latest | Generador de texto ASCII art |
| [lolcat](https://github.com/busyloop/lolcat) | Latest | Añade colores al texto en terminal |

## 📋 Requisitos

- Sistema operativo Linux (Ubuntu/Debian recomendado)
- Git
- Sudo
- Conexión a internet
- Mínimo 4GB de RAM (recomendado para Docker)

## 🛠️ Instalación

1. Clona el repositorio:
```bash
git clone https://github.com/JoseClementeDev/dotfiles ~/dotfiles
```

2. Dale permisos de ejecución:
```bash
chmod -R 755 ~/dotfiles/
```

3. Ejecuta el script de validación para verificar que todo está correcto:
```bash
~/dotfiles/bin/validate.sh
```

4. Ejecuta el script de instalación:
```bash
~/dotfiles/setup.sh
```

## 📁 Estructura del Proyecto

```
dotfiles/
├── .gitignore              # Archivos ignorados por git
├── LICENSE                 # Licencia MIT
├── README.md              # Este archivo
├── setup.sh               # Script principal de instalación
├── bin/                   # Scripts de utilidad
│   ├── create-symlinks.sh # Creación de enlaces simbólicos
│   ├── logger.sh         # Utilidades de logging
│   └── validate.sh       # Script de validación
├── config/                # Archivos de configuración
│   ├── git/              # Configuraciones de Git
│   │   └── .gitconfig    # Configuración global de Git
│   └── shell/            # Configuraciones de shell
│       ├── .aliases      # Alias personalizados
│       ├── .bashrc       # Configuración de Bash
│       └── .zshrc        # Configuración de ZSH
└── install/              # Scripts de instalación
    ├── programs/         # Scripts específicos para programas
    │   ├── awscliv2.sh   # Instalación de AWS CLI
    │   ├── docker.sh     # Instalación de Docker
    │   ├── dotnet.sh     # Instalación de .NET SDK
    │   ├── eza.sh        # Instalación de eza
    │   ├── fzf.sh        # Instalación de fzf
    │   ├── k6.sh         # Instalación de k6
    │   ├── node.sh       # Instalación de Node.js
    │   └── python.sh     # Instalación de Python
    ├── install-apt.sh    # Instalación de paquetes apt
    ├── install-npm.sh    # Instalación de paquetes npm
    └── install-pip.sh    # Instalación de paquetes pip
```

## 🔧 Personalización

Puedes personalizar las configuraciones editando los archivos en el directorio `config/`:

- `config/shell/.aliases`: Alias personalizados
- `config/shell/.zshrc`: Configuración de ZSH
- `config/git/.gitconfig`: Configuración de Git

## 🧪 Validación

Para verificar que todo está correctamente configurado, puedes ejecutar el script de validación:

```bash
./bin/validate.sh
```

Este script verificará:
- La estructura de directorios
- La existencia de archivos necesarios
- Los permisos de ejecución
- La sintaxis de los scripts

## 🔄 Actualización

Para actualizar tus dotfiles:

```bash
cd ~/dotfiles
git pull
./setup.sh
```

## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.