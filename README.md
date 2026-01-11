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
- ABASM 1.4.0 (Se instala con Dev8BP)
- SDCC (Obligatorio si compilas codigo C para 8BP)

## Instalación

1. Clona el repositorio con submódulos:
```bash
git clone https://github.com/destroyer-dcf/Dev8BP.git
cd Dev8BP
```

2. Configura la variable de entorno `DEV8BP_PATH`:
```bash
# Ejecuta el script de configuración (añade la variable a .bashrc/.zshrc)
./setup.sh

# Recarga tu shell o ejecuta:
source ~/.bashrc  # o ~/.zshrc si usas zsh
```

La variable `DEV8BP_PATH` permite usar Dev8BP desde cualquier ubicación en tu sistema.

## Configuración

1. Copia el archivo de ejemplo a tu proyecto:
```bash
cp Makefile.example Makefile
```

2. Edita el `Makefile` con la configuración de tu proyecto:

```makefile
# Verificar que DEV8BP_PATH está definida
ifndef DEV8BP_PATH
$(error DEV8BP_PATH no está definida. Ejecuta setup.sh)
endif

# ============================================
# CONFIGURACIÓN DEL PROYECTO
# ============================================

# Nombre del proyecto (usado para el DSK)
PROJECT_NAME := MI_JUEGO

# Nivel de compilación (0-4)
BUILD_LEVEL := 0

# Ruta al directorio ASM del proyecto
ASM_PATH := $(CURDIR)/ASM

# Ruta al directorio BASIC (archivos .bas que se añadirán al DSK)
BASIC_PATH := $(CURDIR)/bas

# Ruta al directorio C (código C con SDCC - opcional)
C_PATH := $(CURDIR)/C
C_SOURCE := ciclo.c
C_CODE_LOC := 20000

# Directorio de objetos intermedios (bin, lst, map, ihx)
OBJ_DIR := obj

# Directorio de salida para DSK
DIST_DIR := dist

# Nombre de la imagen DSK
DSK := $(PROJECT_NAME).dsk

# Configuración RetroVirtualMachine (opcional - para 'make run')
# RVM_PATH := /Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2
# CPC_MODEL := 464
# RUN_FILE := 8BP0.BIN

# ============================================
# INCLUIR MAKEFILE PRINCIPAL
# ============================================

include $(DEV8BP_PATH)/cfg/Makefile.mk
```

3. Estructura de directorios recomendada:

| Directorio/Archivo | Descripción |
|-------------------|-------------|
| `Makefile` | Configuración del proyecto |
| `ASM/` | Archivos .asm del proyecto (ej: `make_all_mygame.asm`) |
| `bas/` | Archivos BASIC (se añaden automáticamente al DSK) |
| `C/` | Código C (opcional, se compila con SDCC si existe) |
| `obj/` | **Generado**: Archivos intermedios (bin, lst, map, ihx) |
| `dist/` | **Generado**: Imagen DSK final |

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
| **0** | Todas las funcionalidades | 23599 | \|LAYOUT, \|COLAY, \|MAP2SP, \|UMA, \|3D | 19120 bytes |
| **1** | Juegos de laberintos | 24999 | \|LAYOUT, \|COLAY | 17620 bytes |
| **2** | Juegos con scroll | 24799 | \|MAP2SP, \|UMA | 17820 bytes |
| **3** | Juegos pseudo-3D | 23999 | \|3D | 18620 bytes |
| **4** | Sin scroll/layout (+500 bytes) | 25299 | Básicos | 17320 bytes |

## 📝 Comandos Make

| Comando | Descripción |
|---------|-------------|
| `make` | Compila proyecto completo (info + compile + DSK + BASIC + C) |
| `make help` | Muestra la ayuda completa |
| `make info` | Muestra la configuración actual |
| `make dsk` | Crea/actualiza imagen DSK con binario y archivos BASIC |
| `make bas` | Añade archivos BASIC desde `BASIC_PATH` al DSK |
| `make c` | Compila código C con SDCC y añade al DSK |
| `make run` | Ejecuta el DSK en RetroVirtualMachine (requiere configuración) |
| `make clean` | Limpia archivos temporales, obj y dist |

## Variables de Configuración

### Variables del Proyecto (Makefile)

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `PROJECT_NAME` | Nombre del proyecto (usado para generar el DSK: `PROJECT_NAME.dsk`) | - |
| `BUILD_LEVEL` | Nivel de compilación (0-4). Define qué comandos 8BP estarán disponibles | `0` |
| `ASM_PATH` | Ruta al directorio que contiene los archivos ASM del proyecto | `$(CURDIR)/ASM` |
| `BASIC_PATH` | Ruta al directorio con archivos .bas (se añaden automáticamente al DSK) | `$(CURDIR)/bas` |
| `C_PATH` | Ruta al directorio con código C (se compila con SDCC si existe) | `$(CURDIR)/C` |
| `C_SOURCE` | Archivo fuente C principal | `ciclo.c` |
| `C_CODE_LOC` | Dirección de carga del código C (debe ser < 23999 para no destruir 8BP) | `20000` |
| `OBJ_DIR` | Directorio para archivos intermedios (bin, lst, map) | `obj` |
| `DIST_DIR` | Directorio donde se generará el DSK final | `dist` |
| `DSK` | Nombre del archivo DSK generado | `$(PROJECT_NAME).dsk` |
| `RVM_PATH` | Ruta al ejecutable de RetroVirtualMachine (opcional, para `make run`) | - |
| `CPC_MODEL` | Modelo de Amstrad CPC para el emulador RVM (464, 6128, etc.) | `464` |
| `RUN_FILE` | Archivo a ejecutar automáticamente en el emulador (opcional) | - |

> **Nota**: En Mac RVM_PATH se debe poner como ejecutable el binario (/Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2), no /Applications/Retro Virtual Machine 2.app.


### Variables de Sistema (Automáticas)

| Variable | Descripción |
|----------|-------------|
| `DEV8BP_PATH` | Ruta al directorio Dev8bp (configurada por setup.sh) |
| `ABASM_PATH` | Ruta al ensamblador ABASM (detectada automáticamente) |
| `DSK_PATH` | Ruta a dsk.py de ABASM (detectada automáticamente) |
| `HEX2BIN_PATH` | Ruta a hex2bin (detectada según plataforma y arquitectura) |
| `MOT2BIN_PATH` | Ruta a mot2bin (detectada según plataforma y arquitectura) |
| `PYTHON` | Intérprete Python (detectado automáticamente: python3 o python) |

### Ejemplo de Configuración Completa

```makefile
# Verificar que DEV8BP_PATH está definida
ifndef DEV8BP_PATH
$(error DEV8BP_PATH no está definida. Ejecuta setup.sh)
endif

# Configuración del proyecto
PROJECT_NAME := SUPER_GAME
BUILD_LEVEL := 2
ASM_PATH := $(CURDIR)/ASM
BASIC_PATH := $(CURDIR)/bas
C_PATH := $(CURDIR)/C
C_SOURCE := game.c
C_CODE_LOC := 19000
OBJ_DIR := obj
DIST_DIR := dist
DSK := $(PROJECT_NAME).dsk

# Configuración RetroVirtualMachine
RVM_PATH := /Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2
CPC_MODEL := 6128
RUN_FILE := 8BP2.BIN

# Incluir el Makefile principal
include $(DEV8BP_PATH)/cfg/Makefile.mk
```

## 🎮 Uso desde BASIC

Después de compilar, carga el binario en tu Amstrad CPC:

```basic
MEMORY 24799
LOAD"8BP2.bin"
CALL &6B78
```

Ajusta el valor de `MEMORY` según el nivel compilado (ver tabla de niveles).

## 💾 Generación de DSK

El sistema genera automáticamente una imagen DSK después de cada compilación con el siguiente contenido:

### Contenido del DSK

1. **Binario compilado**: `8BPX.bin` (donde X es el nivel de compilación)
   - Direcciones de carga/ejecución configuradas automáticamente
   - Dividido en múltiples extents si supera 16KB

2. **Archivos BASIC**: Todos los archivos `.bas` de `BASIC_PATH`
   - Se copian a `obj/` para conversión a formato DOS
   - Se añaden automáticamente al DSK como archivos ASCII
   - Verificación de newline final para evitar pérdida de líneas

3. **Binarios C** (opcional): Si existe la carpeta `C/` con código fuente
   - Se compila automáticamente con SDCC
   - Se convierte de `.ihx` a `.bin` con hex2bin
   - Se añade al DSK con la dirección de carga especificada en `C_CODE_LOC`
   - Verificación de límites de memoria (no debe exceder 23999 para no destruir 8BP)

### Características

- **Nombre**: `PROJECT_NAME.dsk`
- **Ubicación**: `DIST_DIR/`
- **Recreación**: Automática en cada compilación (evita duplicados)
- **Herramienta**: dsk.py de ABASM (100% Python, multiplataforma)
- **Catálogo**: Se muestra después de añadir cada archivo


La imagen DSK se puede usar directamente en emuladores o hardware real.

## 🔧 Compilación de Código C con SDCC

Dev8BP incluye soporte integrado para compilar código C usando [SDCC](http://sdcc.sourceforge.net/) (Small Device C Compiler).

### Requisitos

- **SDCC** instalado en el sistema
- Carpeta `C/` en tu proyecto con:
  - Archivo fuente (ej: `ciclo.c`)
  - Carpeta `8BP_wrapper/` con `8BP.h`
  - Carpeta `mini_BASIC/` con `minibasic.h`

### Configuración

Añade estas variables a tu `Makefile`:

```makefile
# Path código C (se compilará con SDCC si existe)
C_PATH := $(CURDIR)/C
C_SOURCE := ciclo.c
C_CODE_LOC := 20000    # Dirección de carga (debe ser < 23999)
```

### Uso

```bash
# Compilar solo el código C
make c

# Compilar todo (ASM + BASIC + C)
make
```

### Características

- ✅ **Compilación automática**: Si existe la carpeta `C/`, se compila automáticamente
- ✅ **Verificación de límites**: Verifica que el código no exceda 23999 (0x5DBF) para no destruir la librería 8BP
- ✅ **Conversión automática**: Convierte `.ihx` a `.bin` usando hex2bin
- ✅ **Integración con DSK**: Añade automáticamente el binario al DSK con la dirección de carga correcta
- ✅ **Información del .map**: Muestra la dirección de `_main` y otras funciones

### Proceso de Compilación

1. **Limpia archivos anteriores** de compilación C
2. **Compila con SDCC**:
   ```bash
   sdcc -mz80 --code-loc 20000 --data-loc 0 --no-std-crt0 \
        --fomit-frame-pointer --opt-code-size \
        -I8BP_wrapper -Imini_BASIC ciclo.c
   ```
3. **Convierte .ihx a .bin** con hex2bin
4. **Verifica límites de memoria**: Si excede 23999, sale con error
5. **Añade al DSK** con dirección de carga `C_CODE_LOC`

### Ejemplo de Salida

```
═══════════════════════════════════════
  🔧 Compilar código C con SDCC
═══════════════════════════════════════

Archivo fuente:   C/ciclo.c
Dirección código:  20000 (0x4E20)
SDCC:             /usr/local/bin/sdcc
hex2bin:          Dev8bp/tools/hex2bin/mac-arm64/hex2bin

Compilando con SDCC...
✓ Compilación exitosa

Convirtiendo .ihx a .bin...
Binary file start = 00004E20
Highest address   = 00005857
✓ Límites de memoria OK (highest: 22615 / 0x5857 ≤ 23999 / 0x5DBF)

Añadiendo binario a DSK: ciclo.bin
✓ Binario añadido correctamente

Información del archivo .map:
═══════════════════════════════════════
     000056B0  _main                              ciclo

Uso desde BASIC:
  1) Carga o ensambla 8BP con tus gráficos, música, etc.
  2) Carga tu juego BASIC
  3) LOAD "ciclo.BIN", 20000
  4) CALL &56B0    (dirección de _main)
```

### Límites de Memoria

⚠️ **Importante**: El código C no debe exceder la dirección **23999 (0x5DBF)** para no destruir la librería 8BP.

Si tu código excede este límite:
1. Usa una dirección de código más baja: `C_CODE_LOC := 19000`
2. Ajusta MEMORY en BASIC: `MEMORY 18999`

### Estructura de Proyecto con C

| Directorio/Archivo | Descripción |
|-------------------|-------------|
| `Makefile` | Configuración del proyecto |
| `ASM/` | Archivos .asm del proyecto |
| `bas/` | Archivos BASIC |
| `C/` | Código C |
| `C/ciclo.c` | Archivo fuente C principal |
| `C/8BP_wrapper/` | Headers de la librería 8BP (`8BP.h`) |
| `C/mini_BASIC/` | Headers de mini BASIC (`minibasic.h`) |
| `obj/` | **Generado**: Binarios, lst, map, ihx, asm, rel, etc. |
| `dist/` | **Generado**: Imagen DSK final con todos los binarios |

## 🎮 Ejecutar en RetroVirtualMachine

Dev8BP incluye integración con [RetroVirtualMachine](https://www.retrovirtualmachine.org/) para probar tus proyectos rápidamente.

### Configuración

Añade estas variables a tu `Makefile`:

```makefile
# Configuración RetroVirtualMachine (opcional - para usar 'make run')
# macOS:
RVM_PATH := /Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2
# Linux:
# RVM_PATH := /usr/local/bin/RetroVirtualMachine
# Windows WSL:
# RVM_PATH := /mnt/c/Program Files/RetroVirtualMachine/RetroVirtualMachine.exe

CPC_MODEL := 464        # Modelo: 464, 664, 6128
RUN_FILE := 8BP0.BIN    # Archivo a ejecutar (opcional)
```

### Uso

```bash
# Compilar y ejecutar en un solo comando
make && make run

# Solo ejecutar (si ya compilaste)
make run
```

### Características

- ✅ **Cierre automático**: Mata cualquier sesión anterior de RVM antes de abrir una nueva
- ✅ **Ejecución en background**: No bloquea la terminal
- ✅ **Rutas con espacios**: Maneja correctamente rutas con espacios en el nombre
- ✅ **Auto-ejecución**: Si defines `RUN_FILE`, ejecuta automáticamente el archivo con `RUN"archivo"`
- ✅ **Modelos CPC**: Soporta todos los modelos (464, 664, 6128)



### Ejemplo de Salida

```
═══════════════════════════════════════
  🎮 Ejecutar en RetroVirtualMachine
═══════════════════════════════════════

Emulador:        /Applications/Retro Virtual Machine 2.app/...
Modelo CPC:      464
DSK:             dist/MI_JUEGO.dsk
WARNING: Cerrando sesión anterior de RetroVirtualMachine...
Ejecutando:      8BP0.BIN

✓ RetroVirtualMachine iniciado
```

## 🕹️ Roadmap

- ✅ Compilación 8BP automatizada con ABASM
- ✅ Generación de niveles de compilación (0-4)
- ✅ Generación automática de DSK con dsk.py (Python, multiplataforma)
- ✅ Detección automática de plataforma (macOS/Linux/Windows)
- ✅ Sistema de variables de entorno (DEV8BP_PATH)
- ✅ Organización de archivos (obj/ y dist/)
- ✅ Integración automática de archivos BASIC
- ✅ Compilación de código C con SDCC
- ✅ Herramienta hex2bin multiplataforma (ARM64/x86_64)
- ✅ Ejecución en RetroVirtualMachine (make run)
- 📌 Gestión de imágenes (tiles, scr, etc)
- 📌 Generación TAP
- 📌 Generación de ROMs
- 📌 Test/Run M4Board
- 📌 ...más...

---

## Licencia

MIT License - Copyright (c) 2026 Destroyer

## Agradecimientos

- **[jjaranda13](https://github.com/jjaranda13)** - Creador de [8BP](https://github.com/jjaranda13/8BP)
- **[fragarco](https://github.com/fragarco)** - Creador de [ABASM](https://github.com/fragarco/abasm)

## Contacto

© Destroyer 2026 - [destroyer.dcf@gmail.com](mailto:destroyer.dcf@gmail.com)
