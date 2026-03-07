---
name: devcpc-mcp-orchestrator
description: Usa este skill cuando el usuario pida ejecutar acciones de DevCPC (new, build, validate, info, clean, run, help, version).
---

# DevCPC Orchestrator

## REGLA ABSOLUTA - LEE ESTO PRIMERO

**ACCION INMEDIATA**: Ante cualquier peticion de accion DevCPC, ejecuta el script
correspondiente con runInTerminal SIN LEER ARCHIVOS ANTES. No consultes configuracion,
no leas el proyecto, no analices nada. EJECUTA EL SCRIPT PRIMERO.

Si necesitas informacion adicional (ruta del proyecto, etc.), pide solo lo minimo
necesario para ejecutar el script.

## Ubicacion de scripts

Los scripts estan en este mismo directorio del workspace:
  .github/skills/devcpc-mcp-orchestrator/

Ruta absoluta (sustituye el workspace correspondiente):
  /Users/destroyer/PROJECTS/CPCReady/CPCDevKit/.github/skills/devcpc-mcp-orchestrator/

## Mapeo de acciones a scripts

| Accion            | Script            | Argumentos                              |
|-------------------|-------------------|-----------------------------------------|
| Crear proyecto    | run-new.sh        | <project_name> [template] [working_dir] |
| Compilar          | run-build.sh      | <working_dir>                           |
| Limpiar           | run-clean.sh      | <working_dir>                           |
| Validar           | run-validate.sh   | <working_dir>                           |
| Ver configuracion | run-info.sh       | <working_dir>                           |
| Ejecutar          | run-run.sh        | <working_dir> [dsk|cdt]                |
| Version           | run-version.sh    | (sin argumentos)                        |
| Ayuda             | run-help.sh       | [command]                               |

## Flujo de trabajo

1. Identifica la accion DevCPC solicitada.
2. Resuelve working_dir en ruta absoluta.
3. EJECUTA el script con runInTerminal inmediatamente.
4. Muestra el resultado completo al usuario.
5. Si falla, reporta el error real y propone correccion accionable.
6. Tras cambios de config: run-validate.sh -> run-build.sh.

## Ejemplo

Usuario: "valida el proyecto examples/basic"
Respuesta correcta:
  runInTerminal: /workspace/.github/skills/devcpc-mcp-orchestrator/run-validate.sh /workspace/examples/basic

Respuesta INCORRECTA:
  Leer devcpc.conf, listar directorios, analizar archivos... (NO HAGAS ESTO)
