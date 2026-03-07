# asm

Proyecto creado con **DevCPC CLI** (tipo: **ASM**).

## Tipo de Proyecto: ASM

Proyecto **ensamblador** puro para desarrollo en Z80.
Configuración mínima, activa las rutas que necesites en `devcpc.conf`.

## Estructura

| Ruta | Variable | Descripción |
|------|----------| ------------|
| `src/` | `ASM_PATH` | Código ensamblador Z80 (busca `SOURCE.asm`) |
| `src/assets/screen/` | `LOADER_SCREEN` | Pantallas de carga PNG → SCN *(opcional)* |
| `src/assets/sprites/` | `SPRITES_PATH` | Sprites PNG → ASM *(opcional)* |
| `obj/` | `OBJ_DIR` | Archivos intermedios *(generado)* |
| `dist/` | `DIST_DIR` | Imágenes DSK / CDT / CPR *(generado)* |

## Variables

Estas son las variables disponibles en `devcpc.conf` para este tipo de proyecto.

### Variables del proyecto ASM

| Variable | Descripción | Estado | Dependencias |
|----------|-------------|--------|--------------|
| `PROJECT_NAME` | Nombre del proyecto (usado en DSK, CDT, CPR) | ✅ activa | — |
| `LOADADDR` | Dirección de carga del binario en memoria (hex) | ✅ activa | Requiere `SOURCE` |
| `SOURCE` | Archivo fuente ASM principal (sin extensión `.asm`) | ✅ activa | Requiere `LOADADDR` |
| `TARGET` | Nombre del binario generado (sin extensión) | ✅ activa | — |
| `ASM_PATH` | Ruta al directorio ASM (usa `SOURCE.asm`) o al archivo `.asm` directamente | ✅ activa | — |
| `MODE` | Modo gráfico CPC: 0=16 col · 1=4 col · 2=2 col | ⬜ opcional | — |
| `LOADER_SCREEN` | Carpeta con PNG de pantallas de carga (→ SCN, dirección &C000) | ⬜ opcional | — |
| `SPRITES_PATH` | Carpeta con PNG de sprites (→ ASM) | ⬜ opcional | Requiere `SPRITES_OUT_FILE` |
| `SPRITES_OUT_FILE` | Archivo ASM de salida para los sprites | ⬜ opcional | Requiere `SPRITES_PATH` |
| `OBJ_DIR` | Directorio de archivos intermedios | ✅ activa | — |
| `DIST_DIR` | Directorio de salida (DSK / CDT / CPR) | ✅ activa | — |
| `DSK` | Nombre de la imagen de disco | ✅ activa | — |
| `CDT` | Nombre de la imagen de cinta | ✅ activa | — |
| `CDT_FILES` | Lista de archivos a incluir en la cinta (en orden) | ✅ activa | Requiere `CDT` |
| `CPR` | Nombre del archivo de cartucho CPR | ⬜ opcional | Requiere `CPR_EXECUTE` |
| `CPR_EXECUTE` | Archivo a ejecutar al arrancar el cartucho | ⬜ opcional | Requiere `CPR` |
| `EMULATOR_TYPE` | Tipo de emulador: `integrated` (VS Code) o `rvm` | ✅ activa | — |
| `RVM_PATH` | Ruta al ejecutable de RetroVirtualMachine | ⬜ opcional | Solo si `EMULATOR_TYPE=rvm` |
| `CPC_MODEL` | Modelo de CPC a emular: 464, 664 o 6128 | ✅ activa | — |
| `RUN_FILE` | Archivo a ejecutar automáticamente en el emulador | ✅ activa | — |

## Variables de otros tipos de proyecto

Estas variables están disponibles en `devcpc.conf` pero corresponden a otros tipos. Puedes activarlas si las necesitas:

| Variable | Tipo | Descripción | Dependencias |
|----------|------|-------------|--------------|
| `BUILD_LEVEL` | 8BP | Nivel de compilación 8BP (0-4). Si se activa, sobreescribe `LOADADDR`, `SOURCE` y `TARGET` | — |
| `BASIC_PATH` | BASIC / 8BP | Carpeta con archivos `.bas` (se añaden al DSK automáticamente) | — |
| `BAS_COMPILE` | BASIC | Ruta completa al `.bas` a compilar con ABASC → binario | Requiere `BAS_LOADADDR` |
| `BAS_LOADADDR` | BASIC | Dirección de carga del binario compilado (formato hex) | Requiere `BAS_COMPILE` |
| `RAW_PATH` | BASIC / 8BP | Carpeta con binarios sin encabezado AMSDOS | — |
| `C_PATH` | 8BP | Carpeta con código C (compilado con SDCC) | — |
| `C_SOURCE` | 8BP | Archivo fuente C principal | Requiere `C_PATH` |
| `C_CODE_LOC` | 8BP | Dirección de carga del código C (decimal) | Requiere `C_PATH` |
| `SPRITES_TOLERANCE` | 8BP | Tolerancia RGB por canal (0=exacto, 8=recomendado, -1=auto) | Requiere `SPRITES_PATH` |
| `SPRITES_TRANSPARENT_INK` | 8BP | INK para píxeles transparentes (0-26) | Requiere `SPRITES_PATH` |

## Uso Rápido

```bash
# Compilar proyecto
devcpc build

# Limpiar archivos generados
devcpc clean

# Ejecutar en emulador
# CPC_MODEL 464 → CDT (cinta) | 664/6128 → DSK (disco)
devcpc run

# Ver información del proyecto
devcpc info

# Validar configuración
devcpc validate
```

## Emulador (Opcional)

Para usar `devcpc run`, configura en `devcpc.conf`:

```bash
EMULATOR_TYPE="rvm"  # "integrated" (VS Code) o "rvm" (RetroVirtualMachine)
RVM_PATH="/ruta/a/RetroVirtualMachine"
CPC_MODEL=464        # 464 → CDT | 664/6128 → DSK
```

## 🔄 Conversión entre Tipos de Proyecto

> **Nota:** Este tipo de proyecto (ASM) es solo un punto de partida. Puedes **transformar cualquier proyecto en otro tipo** simplemente editando las variables en `devcpc.conf` y creando las carpetas necesarias.

**Ejemplos de conversión:**

- **BASIC → 8BP**: Descomenta `ASM_PATH`, añade `BUILD_LEVEL=0`, crea carpeta `asm/`
- **ASM → 8BP**: Descomenta `BUILD_LEVEL`, ajusta `ASM_PATH` para usar 8BP, añade `BASIC_PATH`
- **8BP → BASIC**: Comenta `ASM_PATH` y `BUILD_LEVEL`, usa solo `BASIC_PATH`
- **Cualquiera → Híbrido**: Activa múltiples rutas (`ASM_PATH`, `BASIC_PATH`, `C_PATH`) según necesites

**La configuración es completamente flexible.** Las plantillas solo preconfiguran las variables más comunes para cada tipo, pero puedes personalizar tu proyecto como prefieras.

## Documentación Completa

- **DevCPC**: https://github.com/destroyer-dcf/DevCPC

