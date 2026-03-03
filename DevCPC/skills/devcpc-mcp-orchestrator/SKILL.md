---
name: devcpc-mcp-orchestrator
description: Usa este skill cuando el usuario pida ejecutar acciones de DevCPC (new, build, validate, info, clean, run, help, version).
---

# DevCPC Orchestrator

## Cuándo usarlo

Activa este skill cuando la solicitud implique ejecutar comandos de DevCPC o encadenar pasos de build/validacion.

## Regla principal

Ejecuta siempre los scripts de esta skill usando runInTerminal.
Nunca invoques devcpc directamente sin usar el script correspondiente.

## Ubicación de scripts

Todos los scripts están en la carpeta de esta skill:
  DevCPC/skills/devcpc-mcp-orchestrator/

Ruta absoluta de ejemplo (ajusta según workspaceFolder):
  /Users/tu_usuario/proyecto/DevCPC/skills/devcpc-mcp-orchestrator/

## Flujo de trabajo

1. Identifica la intención exacta.
2. Resuelve working_dir en ruta absoluta.
3. Ejecuta el script correcto con runInTerminal.
4. Si falla, reporta el error real y propone corrección accionable.
5. Si hubo cambios de config, ejecuta run-validate.sh y luego run-build.sh.

## Mapeo rápido

| Acción            | Script            | Argumentos                            |
|-------------------|-------------------|---------------------------------------|
| Crear proyecto    | run-new.sh        | <project_name> [template] [working_dir]|
| Compilar          | run-build.sh      | <working_dir>                         |
| Limpiar           | run-clean.sh      | <working_dir>                         |
| Validar           | run-validate.sh   | <working_dir>                         |
| Ver configuración | run-info.sh       | <working_dir>                         |
| Ejecutar          | run-run.sh        | <working_dir> [dsk|cdt]              |
| Versión           | run-version.sh    | (sin argumentos)                      |
| Ayuda             | run-help.sh       | [command]                             |

## Calidad de respuesta

- Reporta acción ejecutada, ruta usada y resultado.
- Si falla, entrega causa probable y siguiente paso concreto.
- Evita respuestas teóricas si puedes verificar ejecutando el script.
