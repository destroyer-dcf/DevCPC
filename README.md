# Dev8BP

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows%20WSL-lightgrey.svg)]()
[![Python](https://img.shields.io/badge/python-3.x-blue.svg)](https://www.python.org/)
[![ABASM](https://img.shields.io/badge/ABASM-1.4.0%20%20-green.svg)](https://github.com/fragarco/abasm)
[![Amstrad CPC](https://img.shields.io/badge/Amstrad-CPC-red.svg)]()
[![Make](https://img.shields.io/badge/build-Make-orange.svg)]()
[![8BP](https://img.shields.io/badge/8BP-v0.43-purple.svg)](https://github.com/jjaranda13/8BP)

Sistema de compilación para [8BP](https://github.com/jjaranda13/8BP) utilizando [ABASM](https://github.com/fragarco/abasm) con generación automática de imágenes DSK.

## Sistemas Soportados

- ✅ Windows (WSL o MSYS2 MinGW64)
- ✅ Linux
- ✅ macOS

## Requisitos

- Python 3.x
- Make
- Git (para submódulos)
- ABASM (incluido como submódulo)
- iDSK20 (incluido, multiplataforma)

## Instalación

1. Clona el repositorio con submódulos:
```bash
git clone --recurse-submodules https://github.com/tu-usuario/Dev8BP.git
cd Dev8BP
```

2. Si ya clonaste el repositorio sin submódulos:
```bash
git submodule update --init --recursive
```

## Configuración

1. Copia el archivo de ejemplo:
```bash
cp Makefile.example Makefile
```

2. Edita el `Makefile` con la configuración de tu proyecto:
```makefile
# Nombre del proyecto (usado para el DSK)
PROJECT_NAME := MI_JUEGO

# Nivel de compilación (0-4)
BUILD_LEVEL := 0

# Ruta al directorio ASM del proyecto
8BP_ASM_PATH := ./mi_proyecto/ASM

# Directorio de salida para los binarios compilados
DIST_DIR := ./mi_proyecto/dist
```

## Uso

### Compilación Simple

```bash
# Compilar proyecto completo (compila + crea DSK)
make

# Ver configuración actual
make info

# Limpiar archivos generados
make clean

# Ver ayuda
make help
```

### Niveles de Compilación

Cada nivel optimiza el código para diferentes tipos de juegos. Define el nivel en tu `Makefile` con la variable `BUILD_LEVEL`:

| Nivel | Descripción | MEMORY | Comandos Disponibles | Tamaño |
|-------|-------------|--------|---------------------|--------|
| **0** | Todas las funcionalidades | 23600 | \|LAYOUT, \|COLAY, \|MAP2SP, \|UMA, \|3D | 19120 bytes |
| **1** | Juegos de laberintos | 25000 | \|LAYOUT, \|COLAY | 17620 bytes |
| **2** | Juegos con scroll | 24800 | \|MAP2SP, \|UMA | 17820 bytes |
| **3** | Juegos pseudo-3D | 24000 | \|3D | 18620 bytes |
| **4** | Sin scroll/layout (+500 bytes) | 25300 | Básicos | 17320 bytes |

## 📝 Comandos Make

| Comando | Descripción |
|---------|-------------|
| `make` | Compila proyecto completo (info + compile + DSK) |
| `make help` | Muestra la ayuda completa |
| `make info` | Muestra la configuración actual |
| `make dsk` | Crea/actualiza imagen DSK con binario |
| `make clean` | Limpia archivos temporales y dist |

## 🔧 Variables de Configuración

### Variables del Proyecto (Makefile)

| Variable | Descripción |
|----------|-------------|
| `PROJECT_NAME` | Nombre del proyecto (usado para generar el DSK: `PROJECT_NAME.dsk`) |
| `BUILD_LEVEL` | Nivel de compilación (0-4). Define qué comandos 8BP estarán disponibles |
| `8BP_ASM_PATH` | Ruta al directorio que contiene los archivos ASM del proyecto |
| `DIST_DIR` | Directorio donde se generarán los binarios y el DSK |

### Variables Automáticas (No modificar)

| Variable | Descripción |
|----------|-------------|
| `ABASM_PATH` | Ruta al ensamblador ABASM (detectada automáticamente según plataforma) |
| `IDSK_PATH` | Ruta al binario iDSK20 (detectada automáticamente según SO y arquitectura) |
| `PYTHON` | Intérprete Python (detectado automáticamente: python3 o python) |
| `DSK` | Nombre del archivo DSK generado (`$(PROJECT_NAME).dsk`) |

### Ejemplo de Configuración Completa

```makefile
# Incluir el Makefile principal
MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(MAKEFILE_DIR)/Dev8bp/cfg/Makefile.mk

# Configuración del proyecto
PROJECT_NAME := SUPER_GAME
BUILD_LEVEL := 2
8BP_ASM_PATH := $(CURDIR)/src/asm
DIST_DIR := $(CURDIR)/build
```

## 🎮 Uso desde BASIC

Después de compilar, carga el binario en tu Amstrad CPC:

```basic
MEMORY 24800
LOAD"8BP2.bin"
CALL &6B78
```

Ajusta el valor de `MEMORY` según el nivel compilado (ver tabla de niveles).

## 💾 Generación de DSK

El sistema genera automáticamente una imagen DSK después de cada compilación:

- **Nombre**: `PROJECT_NAME.dsk`
- **Contenido**: Binario compilado (`8BPX.bin`) con direcciones de carga/ejecución correctas
- **Ubicación**: `DIST_DIR/`
- **Sobrescritura**: Automática (flag `-f`)

La imagen DSK se puede usar directamente en emuladores o hardware real.

## 🕹️ Roadmap

- ✅ Compilación 8BP automatizada con ABASM
- ✅ Generación de niveles de compilación (0-4)
- ✅ Generación automática de DSK con iDSK20
- ✅ Detección automática de plataforma (macOS/Linux/Windows)
- 📌 Gestión de imágenes (tiles, scr, etc)
- 📌 Generación TAP
- 📌 Generación de ROMs
- 📌 Test/Run Retro Virtual Machine (RVM)
- 📌 Test/Run M4Board
- 📌 Instalador Dev8BP
- 📌 ...más...

---

## Licencia

MIT License - Copyright (c) 2026 Destroyer

## Agradecimientos

- **[jjaranda13](https://github.com/jjaranda13)** - Creador de [8BP](https://github.com/jjaranda13/8BP)
- **[fragarco](https://github.com/fragarco)** - Creador de [ABASM](https://github.com/fragarco/abasm)

## Contacto

© Destroyer 2026 - [destroyer.dcf@gmail.com](mailto:destroyer.dcf@gmail.com)
