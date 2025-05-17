# Dotfiles

Mi configuración personal de dotfiles para Linux. Este repositorio contiene mis configuraciones y scripts para configurar rápidamente un nuevo sistema.

## 🚀 Características

- Configuración de shell (ZSH con Antigen)
- Configuraciones de Vim
- Configuraciones de Git
- Scripts de instalación automatizados
- Gestión de paquetes (apt, pip, npm)

## 📋 Requisitos

- Sistema operativo Linux (Ubuntu/Debian recomendado)
- Git
- Sudo
- Conexión a internet

## 🛠️ Instalación

1. Clona el repositorio:
```bash
git clone https://github.com/JoseClementeDev/dotfiles ~/dotfiles
```

2. Dale permisos de ejecución:
```bash
chmod -R 755 ~/dotfiles/
```

3. Ejecuta el script de instalación:
```bash
~/dotfiles/install.sh
```

## 📁 Estructura del Proyecto

```
dotfiles/
├── configs/          # Archivos de configuración
├── scripts/          # Scripts de instalación y utilidades
│   ├── programs/     # Scripts específicos para programas
│   ├── aptinstall.sh # Instalación de paquetes apt
│   ├── pipinstall.sh # Instalación de paquetes pip
│   └── symlink.sh    # Creación de enlaces simbólicos
└── install.sh        # Script principal de instalación
```

## 🔧 Personalización

Puedes personalizar las configuraciones editando los archivos en el directorio `configs/`. Los cambios se aplicarán la próxima vez que ejecutes el script de instalación.

## ⚠️ Troubleshooting

Si encuentras algún problema durante la instalación:

1. Verifica que tienes todos los requisitos instalados
2. Asegúrate de tener permisos de sudo
3. Revisa los logs de instalación
4. Si el problema persiste, crea un issue en el repositorio

## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue primero para discutir los cambios que te gustaría hacer.
