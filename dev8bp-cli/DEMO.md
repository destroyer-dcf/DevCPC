# Demo del Prototipo Dev8BP CLI

## ¿Qué es esto?

Este es un **prototipo funcional** de un sistema de compilación basado en **scripts bash** en lugar de Makefiles, diseñado específicamente para usuarios de retrocomputación (Amstrad CPC).

## ¿Por qué bash en lugar de Make?

### Usuarios objetivo: Comunidad Amstrad
- Vienen de **MS-DOS / CP/M** (acostumbrados a `.BAT`)
- Programan en **BASIC** (simplicidad)
- Muchos usan **Windows** (no están familiarizados con Make)
- **No son desarrolladores Unix**

### Ventajas para usuarios
- ✅ **Más simple**: `dev8bp build` en lugar de configurar Makefiles
- ✅ **Más familiar**: Similar a scripts `.BAT` de DOS
- ✅ **Menos intimidante**: No necesitan aprender Make
- ✅ **Mensajes claros**: Output colorido y amigable
- ✅ **Guiado**: Wizards interactivos

### Ventajas para el desarrollador (tú)
- ✅ **Más fácil de mantener**: Bash es más directo que Make
- ✅ **Más fácil de debuggear**: `set -x` para ver cada paso
- ✅ **Más flexible**: Lógica condicional más clara
- ✅ **Menos "magia"**: Todo es explícito

## Estado actual

### ✅ Implementado
- [x] Script principal `dev8bp` con subcomandos
- [x] Comando `new` - Crear proyectos
- [x] Comando `info` - Mostrar configuración
- [x] Comando `validate` - Validar proyecto
- [x] Comando `clean` - Limpiar archivos
- [x] Comando `help` - Ayuda
- [x] Sistema de colores y mensajes amigables
- [x] Archivo de configuración simple (`dev8bp.conf`)
- [x] Detección de sistema operativo y arquitectura
- [x] Validación de herramientas

### 🚧 Por implementar
- [ ] Comando `build` - Compilación completa
  - [ ] Compilar ASM con ABASM
  - [ ] Crear DSK
  - [ ] Añadir archivos BASIC
  - [ ] Añadir archivos RAW
  - [ ] Compilar C con SDCC
  - [ ] Verificar límites de memoria (_END_GRAPH)
- [ ] Comando `run` - Ejecutar en emulador (stub creado)
- [ ] Wizards interactivos
- [ ] Tests

## Demostración

### 1. Crear nuevo proyecto

```bash
$ dev8bp new mi-juego

═══════════════════════════════════════
  Crear Nuevo Proyecto
═══════════════════════════════════════

ℹ Nombre del proyecto: mi-juego

→ Creando estructura de directorios...
✓ Directorios creados
→ Creando archivo de configuración...
✓ dev8bp.conf creado
→ Creando README...
✓ README.md creado
→ Creando .gitignore...
✓ .gitignore creado

✓ Proyecto 'mi-juego' creado exitosamente!

ℹ Próximos pasos:

  1. cd mi-juego
  2. Edita dev8bp.conf según tus necesidades
  3. Añade tu código en ASM/, bas/, etc.
  4. dev8bp build
```

### 2. Ver configuración

```bash
$ cd mi-juego
$ dev8bp info

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

### 3. Validar proyecto

```bash
$ dev8bp validate

═══════════════════════════════════════
  Validar Proyecto: mi-juego
═══════════════════════════════════════

→ Validando configuración...
✓ PROJECT_NAME: mi-juego
✓ BUILD_LEVEL: 0 (Todas las funcionalidades)

→ Validando rutas...
✓ ASM_PATH: ASM
⚠   make_all_mygame.asm no encontrado
✓ BASIC_PATH: bas (0 archivo(s) .bas)

→ Validando herramientas...
✓ Python 3 instalado

═══════════════════════════════════════
  Resumen de Validación
═══════════════════════════════════════

⚠ 1 advertencia(s) encontrada(s)
```

### 4. Archivo de configuración

El archivo `dev8bp.conf` es **mucho más simple** que un Makefile:

```bash
# Configuración del proyecto Dev8BP
PROJECT_NAME="mi-juego"
BUILD_LEVEL=0

# Rutas opcionales (comenta las que no uses)
ASM_PATH="ASM"
BASIC_PATH="bas"
#RAW_PATH="raw"
#C_PATH="C"

# Emulador (opcional)
#RVM_PATH="/Applications/Retro Virtual Machine 2.app/..."
#CPC_MODEL=464
#RUN_FILE="8BP0.BIN"
```

## Comparación: Make vs Bash

### Makefile actual (complejo)
```makefile
ifndef DEV8BP_PATH
$(error DEV8BP_PATH no está definida)
endif

PROJECT_NAME := MI_JUEGO
BUILD_LEVEL := 0
ASM_PATH := $(CURDIR)/ASM
BASIC_PATH := $(CURDIR)/bas

include $(DEV8BP_PATH)/cfg/Makefile.mk
```

### dev8bp.conf (simple)
```bash
PROJECT_NAME="MI_JUEGO"
BUILD_LEVEL=0
ASM_PATH="ASM"
BASIC_PATH="bas"
```

## Próximos pasos

1. **Implementar `build`**: Portar toda la lógica de compilación de Makefile.mk a bash
2. **Testing**: Probar con proyectos reales
3. **Documentación**: Actualizar README con el nuevo sistema
4. **Migración**: Crear guía de migración de Make a CLI
5. **Retrocompatibilidad**: Mantener Makefiles como opción alternativa

## Decisión

¿Seguimos con este enfoque? Ventajas:

- ✅ Más amigable para usuarios Amstrad
- ✅ Más fácil de mantener para ti
- ✅ Mejor experiencia de usuario
- ✅ Más extensible (wizards, validaciones, etc.)

Desventaja:

- ❌ No es "estándar" en proyectos de compilación
- ❌ Pero... ¿importa si tus usuarios no son desarrolladores Unix? 😄

## Pruébalo

```bash
cd dev8bp-cli
./bin/dev8bp help
./bin/dev8bp new test-project
cd test-project
../bin/dev8bp info
../bin/dev8bp validate
```
