# Dev8BP CLI - Sistema de Compilación para 8BP

Sistema de compilación moderno basado en scripts bash, diseñado específicamente para usuarios de retrocomputación (Amstrad CPC). **Más simple, más amigable, más potente.**

---

## 🎯 ¿Por qué Dev8BP CLI?

### Para usuarios de Amstrad CPC
- ✅ **Más simple que Make** - No necesitas aprender Makefiles
- ✅ **Familiar** - Similar a scripts `.BAT` de MS-DOS
- ✅ **Mensajes claros** - Output colorido y amigable
- ✅ **Guiado** - Validaciones y ayudas en cada paso
- ✅ **Autocontenido** - Incluye todas las herramientas necesarias

### Características principales
- 🚀 **Un comando, una acción** - `dev8bp build`, `dev8bp run`, etc.
- 🎨 **Output colorido** - Fácil de entender qué está pasando
- ✅ **Validaciones automáticas** - Verifica todo antes de compilar
- 🔧 **Configuración simple** - Archivo `dev8bp.conf` en lugar de Makefile
- 📦 **Todo incluido** - ABASM, dsk.py, hex2bin integrados

---

## 📦 ¿Qué incluye?

### Herramientas integradas
- ✅ **ABASM** - Ensamblador para Z80
- ✅ **dsk.py** - Gestión de imágenes DSK
- ✅ **hex2bin** - Conversión para código C (multiplataforma)

### Plataformas soportadas
- ✅ macOS (ARM64 y x86_64)
- ✅ Linux (ARM64 y x86_64)
- ✅ Windows (WSL o Git Bash)

---

## 🚀 Inicio Rápido

### 1. Instalación

```bash
# Clonar el repositorio
git clone https://github.com/destroyer-dcf/Dev8BP.git
cd Dev8BP/dev8bp-cli

# Hacer ejecutable (solo la primera vez)
chmod +x bin/dev8bp

# Opcional: Añadir al PATH para usar desde cualquier lugar
echo 'export PATH="$PATH:'"$(pwd)/bin"'"' >> ~/.bashrc
source ~/.bashrc
```

### 2. Crear tu primer proyecto

```bash
# Crear nuevo proyecto
dev8bp new mi-juego

# Entrar al proyecto
cd mi-juego

# Ver la estructura creada
ls -la
```

### 3. Configurar el proyecto

Edita `dev8bp.conf` según tus necesidades:

```bash
# Configuración básica
PROJECT_NAME="mi-juego"
BUILD_LEVEL=0

# Rutas (comenta las que no uses)
ASM_PATH="ASM"
BASIC_PATH="bas"
#RAW_PATH="raw"
#C_PATH="C"
```

### 4. Añadir tu código

```bash
# Copiar tus archivos ASM
cp /ruta/a/tus/archivos/*.asm ASM/

# Copiar archivos BASIC
cp /ruta/a/tus/archivos/*.bas bas/
```

### 5. Compilar

```bash
# Compilar todo
dev8bp build

# Ver el resultado
ls -la dist/
```

### 6. Ejecutar (opcional)

```bash
# Configurar emulador en dev8bp.conf
# RVM_PATH="/ruta/a/RetroVirtualMachine"
# CPC_MODEL=464
# RUN_FILE="8BP0.BIN"

# Ejecutar
dev8bp run
```

---

## 📚 Comandos Disponibles

### `dev8bp new <nombre>`
Crea un nuevo proyecto con estructura completa.

```bash
dev8bp new mi-super-juego
```

**Crea:**
- Directorios: `ASM/`, `bas/`, `obj/`, `dist/`
- Archivo de configuración: `dev8bp.conf`
- `README.md` con instrucciones
- `.gitignore` configurado

---

### `dev8bp build`
Compila el proyecto completo.

```bash
dev8bp build
```

**Proceso:**
1. ✅ Compila código ASM con ABASM (si `ASM_PATH` está definido)
2. ✅ Verifica límites de gráficos (`_END_GRAPH < 42040`)
3. ✅ Crea imagen DSK
4. ✅ Añade binario ASM al DSK
5. ✅ Añade archivos BASIC al DSK (si `BASIC_PATH` está definido)
6. ✅ Añade archivos RAW al DSK (si `RAW_PATH` está definido)
7. ✅ Compila código C con SDCC (si `C_PATH` está definido)
8. ✅ Verifica límites de memoria C
9. ✅ Muestra catálogo del DSK
10. ✅ Muestra resumen e instrucciones de uso

**Ejemplo de salida:**
```
═══════════════════════════════════════
  Compilar Proyecto: mi-juego
═══════════════════════════════════════

ℹ Build Level: 0 (Todas las funcionalidades)
ℹ Memoria BASIC: MEMORY 23599

✓ Compilación exitosa
✓ Límite de gráficos respetado (< 42040)
✓ DSK creado
✓ 1 archivo(s) BASIC añadidos

Catálogo del DSK:
0: 8BP0    .BIN  [ st: 0 extend: 0 data pages: 128 ]
1: LOADER  .BAS  [ st: 0 extend: 0 data pages: 3 ]

✓ Proyecto compilado exitosamente
```

---

### `dev8bp clean`
Limpia archivos generados.

```bash
dev8bp clean
```

**Elimina:**
- Directorio `obj/` (archivos intermedios)
- Directorio `dist/` (DSK generado)
- Archivos backup en `ASM/` (*.backup, *.bak)

---

### `dev8bp info`
Muestra la configuración del proyecto.

```bash
dev8bp info
```

**Muestra:**
- Nombre del proyecto
- Build level y descripción
- Rutas configuradas
- Directorios de salida
- Configuración del emulador

**Ejemplo:**
```
═══════════════════════════════════════
  Configuración del Proyecto
═══════════════════════════════════════

Proyecto:        mi-juego
Build Level:     0

Rutas configuradas:
  ✓ ASM:    ASM
  ✓ BASIC:  bas

Directorios:
  Objetos:  obj
  Salida:   dist
  DSK:      mi-juego.dsk
```

---

### `dev8bp validate`
Valida el proyecto antes de compilar.

```bash
dev8bp validate
```

**Verifica:**
- ✅ Configuración correcta
- ✅ Rutas existen
- ✅ Archivos necesarios presentes
- ✅ Herramientas instaladas (Python, SDCC)

**Ejemplo:**
```
═══════════════════════════════════════
  Validar Proyecto: mi-juego
═══════════════════════════════════════

→ Validando configuración...
✓ PROJECT_NAME: mi-juego
✓ BUILD_LEVEL: 0 (Todas las funcionalidades)

→ Validando rutas...
✓ ASM_PATH: ASM
✓   make_all_mygame.asm encontrado
✓ BASIC_PATH: bas (2 archivo(s) .bas)

→ Validando herramientas...
✓ Python 3 instalado

═══════════════════════════════════════
  Resumen de Validación
═══════════════════════════════════════

✓ Proyecto válido - Sin errores ni advertencias
```

---

### `dev8bp run`
Ejecuta el DSK en RetroVirtualMachine.

```bash
dev8bp run
```

**Requisitos:**
- RetroVirtualMachine instalado
- `RVM_PATH` configurado en `dev8bp.conf`

**Características:**
- Cierra sesiones anteriores automáticamente
- Carga el DSK generado
- Auto-ejecuta archivo si `RUN_FILE` está configurado

---

### `dev8bp help`
Muestra ayuda general.

```bash
dev8bp help
```

---

### `dev8bp version`
Muestra la versión.

```bash
dev8bp version
```

---

## ⚙️ Configuración (dev8bp.conf)

### Configuración básica

```bash
# Nombre del proyecto (usado para el DSK)
PROJECT_NAME="MI_JUEGO"

# Nivel de compilación (0-4)
BUILD_LEVEL=0
```

### Niveles de compilación

| Nivel | Descripción | MEMORY | Comandos | Tamaño |
|-------|-------------|--------|----------|--------|
| **0** | Todas las funcionalidades | 23599 | \|LAYOUT, \|COLAY, \|MAP2SP, \|UMA, \|3D | 19120 bytes |
| **1** | Juegos de laberintos | 24999 | \|LAYOUT, \|COLAY | 17620 bytes |
| **2** | Juegos con scroll | 24799 | \|MAP2SP, \|UMA | 17820 bytes |
| **3** | Juegos pseudo-3D | 23999 | \|3D | 18620 bytes |
| **4** | Sin scroll/layout | 25299 | Básicos | 17320 bytes |

### Rutas opcionales

```bash
# Código ensamblador 8BP
ASM_PATH="ASM"

# Archivos BASIC (se añaden al DSK automáticamente)
BASIC_PATH="bas"

# Archivos RAW (se añaden sin encabezado AMSDOS)
RAW_PATH="raw"

# Código C (se compila con SDCC)
C_PATH="C"
C_SOURCE="main.c"
C_CODE_LOC=20000
```

**Nota:** Comenta las rutas que no uses. Solo se procesan las definidas.

### Directorios de salida

```bash
# Archivos intermedios (bin, lst, map, ihx)
OBJ_DIR="obj"

# DSK final
DIST_DIR="dist"

# Nombre del DSK
DSK="${PROJECT_NAME}.dsk"
```

### Emulador (opcional)

```bash
# macOS
RVM_PATH="/Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2"

# Linux
#RVM_PATH="/usr/local/bin/RetroVirtualMachine"

# Windows WSL
#RVM_PATH="/mnt/c/Program Files/RetroVirtualMachine/RetroVirtualMachine.exe"

# Modelo de CPC
CPC_MODEL=464

# Archivo a ejecutar automáticamente
RUN_FILE="8BP0.BIN"
```

---

## 📁 Estructura de Proyecto

### Proyecto típico

```
mi-juego/
├── dev8bp.conf          # Configuración
├── README.md            # Documentación
├── .gitignore          # Git ignore
├── ASM/                # Código ensamblador
│   ├── make_all_mygame.asm
│   ├── images_mygame.asm
│   └── ...
├── bas/                # Archivos BASIC
│   ├── loader.bas
│   └── menu.bas
├── raw/                # Archivos RAW (opcional)
│   └── data.bin
├── C/                  # Código C (opcional)
│   ├── main.c
│   ├── 8BP_wrapper/
│   └── mini_BASIC/
├── obj/                # Generado: archivos intermedios
│   ├── 8BP0.bin
│   ├── *.lst
│   └── *.map
└── dist/               # Generado: DSK final
    └── mi-juego.dsk
```

---

## 🔧 Compilación de Código C

### Requisitos

1. **SDCC instalado**
   ```bash
   # macOS
   brew install sdcc
   
   # Linux
   sudo apt-get install sdcc
   
   # Verificar
   sdcc --version
   ```

2. **Estructura de carpetas**
   ```
   C/
   ├── main.c
   ├── 8BP_wrapper/
   │   └── 8BP.h
   └── mini_BASIC/
       └── minibasic.h
   ```

### Configuración

```bash
C_PATH="C"
C_SOURCE="main.c"
C_CODE_LOC=20000    # Dirección de carga (debe ser < 23999)
```

### Límites de memoria

⚠️ **Importante:** El código C no debe exceder la dirección **23999 (0x5DBF)** para no destruir la librería 8BP.

**Si excedes el límite:**
```bash
# Usa una dirección más baja
C_CODE_LOC=19000

# Y en BASIC:
MEMORY 18999
```

### Uso desde BASIC

```basic
10 REM Cargar 8BP con gráficos
20 MEMORY 23599
30 LOAD"8BP0.bin"
40 CALL &6B78
50 REM Cargar tu código C
60 LOAD"main.BIN",20000
70 CALL &56B0    ' Dirección de _main (ver .map)
```

---

## 🎮 Uso con RetroVirtualMachine

### Configuración

```bash
# En dev8bp.conf
RVM_PATH="/Applications/Retro Virtual Machine 2.app/Contents/MacOS/Retro Virtual Machine 2"
CPC_MODEL=464
RUN_FILE="8BP0.BIN"
```

### Ejecutar

```bash
# Compilar y ejecutar
dev8bp build && dev8bp run

# Solo ejecutar (si ya compilaste)
dev8bp run
```

### Características

- ✅ Cierra sesiones anteriores automáticamente
- ✅ Carga el DSK generado
- ✅ Auto-ejecuta el archivo especificado
- ✅ Funciona en background

---

## 🐛 Solución de Problemas

### Error: "ABASM no encontrado"

```bash
# Verificar que dev8bp-cli/tools/abasm existe
ls -la dev8bp-cli/tools/abasm/

# Si no existe, copiar desde Dev8bp
cp -r Dev8bp/tools/abasm dev8bp-cli/tools/
```

### Error: "Python no encontrado"

```bash
# Instalar Python 3
# macOS
brew install python3

# Linux
sudo apt-get install python3

# Verificar
python3 --version
```

### Error: "SDCC no instalado"

```bash
# Solo necesario si compilas código C
# macOS
brew install sdcc

# Linux
sudo apt-get install sdcc
```

### Error: "_END_GRAPH excede 42040"

Tu proyecto usa demasiados gráficos. **Soluciones:**

1. **Reducir gráficos** - Elimina sprites o tiles no usados
2. **Ensamblar en otra zona:**
   ```asm
   ; En tu código ASM
   org 22000
   ; Gráficos extra aquí
   ```
   ```basic
   ' En BASIC
   MEMORY 21999
   ```

### Error: "Código C excede 23999"

Tu código C es demasiado grande. **Soluciones:**

1. **Usar dirección más baja:**
   ```bash
   C_CODE_LOC=19000
   ```
   ```basic
   MEMORY 18999
   ```

2. **Optimizar código** - Reducir tamaño del ejecutable

---

## 💡 Consejos y Trucos

### Workflow recomendado

```bash
# 1. Validar antes de compilar
dev8bp validate

# 2. Compilar
dev8bp build

# 3. Si hay errores, limpiar y reintentar
dev8bp clean
dev8bp build

# 4. Ejecutar para probar
dev8bp run
```

### Compilación rápida

```bash
# Alias útil (añadir a ~/.bashrc)
alias d8b='dev8bp'

# Uso
d8b build
d8b run
```

### Ver solo errores

```bash
dev8bp build 2>&1 | grep -E "(✗|Error)"
```

### Compilar múltiples niveles

```bash
# Compilar nivel 0
dev8bp build

# Cambiar a nivel 2 en dev8bp.conf
# BUILD_LEVEL=2

# Compilar nivel 2
dev8bp build
```

---

## 📖 Ejemplos Completos

### Ejemplo 1: Proyecto solo ASM

```bash
# Crear proyecto
dev8bp new juego-asm
cd juego-asm

# Configurar (dev8bp.conf)
PROJECT_NAME="juego-asm"
BUILD_LEVEL=0
ASM_PATH="ASM"

# Copiar código
cp /ruta/a/make_all_mygame.asm ASM/

# Compilar
dev8bp build
```

### Ejemplo 2: Proyecto ASM + BASIC

```bash
# Crear proyecto
dev8bp new juego-completo
cd juego-completo

# Configurar
PROJECT_NAME="juego-completo"
BUILD_LEVEL=0
ASM_PATH="ASM"
BASIC_PATH="bas"

# Copiar archivos
cp /ruta/a/*.asm ASM/
cp /ruta/a/*.bas bas/

# Compilar
dev8bp build
```

### Ejemplo 3: Proyecto con C

```bash
# Crear proyecto
dev8bp new juego-c
cd juego-c

# Configurar
PROJECT_NAME="juego-c"
BUILD_LEVEL=0
ASM_PATH="ASM"
C_PATH="C"
C_SOURCE="main.c"
C_CODE_LOC=20000

# Copiar archivos
cp /ruta/a/*.asm ASM/
cp /ruta/a/main.c C/
cp -r /ruta/a/8BP_wrapper C/
cp -r /ruta/a/mini_BASIC C/

# Compilar
dev8bp build
```

---

## 🆚 Comparación: Make vs CLI

### Antes (Makefile)

```makefile
ifndef DEV8BP_PATH
$(error DEV8BP_PATH no está definida)
endif

PROJECT_NAME := MI_JUEGO
BUILD_LEVEL := 0
ASM_PATH := $(CURDIR)/ASM
BASIC_PATH := $(CURDIR)/bas
OBJ_DIR := obj
DIST_DIR := dist
DSK := $(PROJECT_NAME).dsk

include $(DEV8BP_PATH)/cfg/Makefile.mk
```

**Problemas:**
- ❌ Sintaxis compleja
- ❌ Necesitas aprender Make
- ❌ Errores crípticos
- ❌ Difícil de debuggear

### Ahora (dev8bp.conf)

```bash
PROJECT_NAME="MI_JUEGO"
BUILD_LEVEL=0
ASM_PATH="ASM"
BASIC_PATH="bas"
```

**Ventajas:**
- ✅ Sintaxis simple
- ✅ Fácil de entender
- ✅ Mensajes claros
- ✅ Validaciones automáticas

---

## 🤝 Contribuir

¿Encontraste un bug? ¿Tienes una sugerencia?

1. Abre un issue en GitHub
2. Describe el problema o sugerencia
3. Incluye ejemplos si es posible

---

## 📄 Licencia

MIT License - Copyright (c) 2026 Destroyer

---

## 🙏 Agradecimientos

- **[jjaranda13](https://github.com/jjaranda13)** - Creador de [8BP](https://github.com/jjaranda13/8BP)
- **[fragarco](https://github.com/fragarco)** - Creador de [ABASM](https://github.com/fragarco/abasm)

---

## 📞 Contacto

© Destroyer 2026 - [destroyer.dcf@gmail.com](mailto:destroyer.dcf@gmail.com)

---

**¿Listo para empezar? 🚀**

```bash
dev8bp new mi-primer-juego
cd mi-primer-juego
dev8bp build
```

## Filosofía

- **Simple**: Un comando, una acción
- **Amigable**: Mensajes claros y coloridos
- **Guiado**: Wizards para tareas comunes
- **Validado**: Verifica todo antes de ejecutar
- **Educativo**: Explica qué está haciendo

## Comandos propuestos

```bash
dev8bp new <nombre>         # Crear nuevo proyecto
dev8bp build                # Compilar proyecto
dev8bp clean                # Limpiar archivos generados
dev8bp run                  # Ejecutar en emulador
dev8bp info                 # Mostrar configuración
dev8bp validate             # Validar proyecto
dev8bp help [comando]       # Ayuda
```

## Archivo de configuración (dev8bp.conf)

Archivo simple en formato bash que el usuario edita:

```bash
# Configuración del proyecto
PROJECT_NAME="MI_JUEGO"
BUILD_LEVEL=0

# Rutas opcionales (comenta las que no uses)
ASM_PATH="ASM"
BASIC_PATH="bas"
RAW_PATH="raw"
#C_PATH="C"

# Emulador (opcional)
#RVM_PATH="/path/to/RetroVirtualMachine"
#CPC_MODEL=464
#RUN_FILE="8BP0.BIN"
```

## Ventajas vs Makefile

1. **Más simple** - No necesitas aprender Make
2. **Más claro** - Mensajes amigables y coloridos
3. **Más guiado** - Wizards interactivos
4. **Más validado** - Verifica antes de compilar
5. **Más mantenible** - Para el desarrollador

## Estado

🚧 **En desarrollo** - Prototipo funcional
