---
name: devcpc-build-troubleshooter
description: Usa este skill cuando el usuario tenga errores de compilacion, validacion, memoria o ejecucion en DevCPC y necesite diagnostico con pasos concretos usando MCP.
---

# DevCPC Build Troubleshooter

## Cuándo usarlo

Activa este skill para errores en `devcpc build`, `devcpc validate` o `devcpc run`.

## Scripts de diagnóstico

Usa los scripts del orquestador en:
```
${workspaceFolder}/DevCPC/skills/devcpc-mcp-orchestrator/
```

## Secuencia mínima

1. Ejecuta `run-validate.sh <working_dir>` para detectar problemas de config.
2. Ejecuta `run-build.sh <working_dir>` para reproducir el error.
3. Revisa `devcpc.conf` y rutas implicadas con `read`.
4. Si aplica, ejecuta `run-info.sh <working_dir>` para ver estado completo.
5. Propón ajuste mínimo y revalida.

## Casos frecuentes

- `_END_GRAPH excede 42040`: reducir sprites/pantallas, revisar `MODE` y `BUILD_LEVEL`.
- `SDCC not found`: instalar SDCC y verificar PATH.
- Fallo de emulador/RVM: revisar `RVM_PATH`, `RUN_MODE` y artefacto generado.
- Errores de `CDT_FILES`: confirmar archivos en `obj/` y orden de carga.

## Política de corrección

- Cambios pequeños, verificables y en orden.
- Evitar reescrituras grandes sin evidencia.
- Tras cada cambio: `run-validate.sh` y luego `run-build.sh`.

## Formato de respuesta

- Diagnóstico breve.
- Cambio aplicado o recomendado.
- Script ejecutado y salida relevante.
- Estado final: resuelto o pendiente con bloqueo concreto.
