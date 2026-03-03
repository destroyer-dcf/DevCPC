---
name: devcpc-project-bootstrap
description: Usa este skill cuando el usuario quiera crear o preparar un proyecto DevCPC nuevo (8bp, asm o basic), validar configuracion inicial y dejar build reproducible usando MCP.
---

# DevCPC Project Bootstrap

## Cuándo usarlo

Activa este skill para peticiones como "crea proyecto", "inicializa plantilla" o "déjalo listo para compilar".

## Scripts

Usa los scripts del orquestador en:
```
${workspaceFolder}/DevCPC/skills/devcpc-mcp-orchestrator/
```

## Flujo recomendado

1. Crear proyecto con `run-new.sh <project_name> [template] [working_dir]`.
2. Validar con `run-validate.sh <working_dir>`.
3. Consultar estado con `run-info.sh <working_dir>`.
4. Compilar con `run-build.sh <working_dir>`.

## Parámetros y defaults

- `template`: `8bp` por defecto, salvo que el usuario pida `asm` o `basic`.
- `working_dir`: siempre absoluto.
- `project_name`: conservar exactamente el nombre solicitado.

## Checklist de salida

- Proyecto creado en la ruta correcta.
- `devcpc.conf` detectado.
- Validación ejecutada y reportada.
- Build inicial ejecutado o motivo del bloqueo.

## Si hay errores

- Error de ruta: confirma `working_dir` y permisos.
- Error de dependencias: propone instalación exacta.
- Error de config: sugiere cambios puntuales antes de reintentar.
