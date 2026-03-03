#!/usr/bin/env bash
# ==============================================================================
# DevCPC CLI - Sistema de compilación para Amstrad CPC
# Copyright (c) 2026 Destroyer
# run.sh - Ejecutar en emulador
# ==============================================================================
#
# FUNCIONALIDADES:
# ----------------
# 1. Ejecutar proyectos DevCPC en RetroVirtualMachine
# 2. Soporte para DSK (disco) y CDT (cinta)
# 3. Auto-detección inteligente según configuración
# 4. Override por línea de comandos
#
# CONFIGURACIÓN EN devcpc.conf:
# ------------------------------
# EMULATOR_TYPE="rvm"                      # Tipo: "rvm" o "integrated"
#   - rvm:        Lanza RetroVirtualMachine desde línea de comandos
#   - integrated: Solo desde Explorador de Tareas de VS Code
# RVM_PATH="/path/to/RetroVirtualMachine"  # Ruta al emulador (solo para rvm)
# CPC_MODEL=6128                           # Modelo CPC (464/664/6128)
# RUN_FILE="loader.bas"                    # Archivo a auto-ejecutar
#
# SELECCIÓN DE MEDIO (automática según CPC_MODEL):
# -------------------------------------------------
# CPC 464        → CDT (cinta), ya que no tiene unidad de disco
# CPC 664/6128   → DSK (disco)
#
# USO:
# ----
# devcpc run                    # Auto-detecta medio según CPC_MODEL
#
# COMPORTAMIENTO:
# ---------------
# DSK: Monta disco y ejecuta RUN_FILE si está definido
#      Comando RVM: -b cpc6128 -i disk.dsk -c 'run"FILE\n'
#
# CDT: Monta cinta, auto-reproduce y ejecuta RUN"
#      Comando RVM: -b cpc464 -i tape.cdt -c 'run"\n' -p
#      La opción -p (play) auto-reproduce la cinta
#
# ==============================================================================

run_project() {
    if ! is_devcpc_project; then
        error "No estás en un proyecto DevCPC"
        exit 1
    fi
    
    load_config

    # Verificar tipo de emulador
    local emulator_type="${EMULATOR_TYPE:-rvm}"
    if [[ "$emulator_type" == "integrated" ]]; then
        echo ""
        warning "El emulador integrado solo puede lanzarse desde el Explorador de Tareas de VS Code"
        echo ""
        info "Usa una de estas tareas en VS Code:"
        echo "  • DevCPC: Run (Auto)"
        echo "  • DevCPC: Run DSK"
        echo "  • DevCPC: Run CDT"
        echo ""
        exit 0
    fi

    if [[ "$emulator_type" != "rvm" ]]; then
        error "EMULATOR_TYPE inválido: $emulator_type"
        info "Valores permitidos: integrated, rvm"
        exit 1
    fi
    
    if [[ -z "$RVM_PATH" ]]; then
        error "RVM_PATH no está configurado en devcpc.conf"
        echo ""
        info "Configura el emulador en devcpc.conf:"
        echo '  RVM_PATH="/ruta/a/RetroVirtualMachine"'
        echo '  CPC_MODEL=464'
        echo '  RUN_FILE="program.bas"'
        echo ""
        exit 1
    fi
    
    if [[ ! -f "$RVM_PATH" ]]; then
        error "RetroVirtualMachine no encontrado en: $RVM_PATH"
        exit 1
    fi
    
    # Determinar medio según modelo de CPC:
    # CPC 464 → CDT (no tiene disco)
    # CPC 664/6128 → DSK
    local cpc_model="${CPC_MODEL:-6128}"
    local media_path=""
    local media_type=""

    if [[ "$cpc_model" == "464" ]]; then
        local cdt_path="$DIST_DIR/$CDT"
        if [[ ! -f "$cdt_path" ]]; then
            error "CDT no encontrado: $cdt_path"
            info "Configura CDT y CDT_FILES en devcpc.conf y ejecuta 'devcpc build'"
            exit 1
        fi
        media_path="$cdt_path"
        media_type="CDT"
    else
        local dsk_path="$DIST_DIR/$DSK"
        if [[ ! -f "$dsk_path" ]]; then
            error "DSK no encontrado: $dsk_path"
            info "Ejecuta 'devcpc build' primero"
            exit 1
        fi
        media_path="$dsk_path"
        media_type="DSK"
    fi
    
    header "Ejecutar en RetroVirtualMachine"
    
    info "Emulador: $RVM_PATH"
    info "Modelo:   $cpc_model"
    info "Medio:    $media_type"
    info "Archivo:  $media_path"
    [[ -n "$RUN_FILE" && "$media_type" == "DSK" ]] && info "Ejecutar: $RUN_FILE"
    echo ""
    
    # Matar procesos existentes
    local rvm_name=$(basename "$RVM_PATH")
    if pgrep -f "$rvm_name" > /dev/null 2>&1; then
        warning "Cerrando sesión anterior de RetroVirtualMachine..."
        pkill -9 -f "$rvm_name"
        sleep 1
    fi
    
    # Ejecutar
    step "Iniciando emulador..."
    
    # Construir argumentos según el tipo de media
    local cmd_args=(-b="cpc${cpc_model}")
    
    if [[ "$media_type" == "CDT" ]]; then
        # CPC 464: cinta con auto-play
        cmd_args+=(-i "$(pwd)/$media_path")
        cmd_args+=(-c="run\"\n")
        cmd_args+=(-p)  # Auto-play tape
    else
        # Para DSK: -i (insert disk) + -c run"FILE
        cmd_args+=(-i "$(pwd)/$media_path")
        if [[ -n "$RUN_FILE" ]]; then
            cmd_args+=(-c="run\"$RUN_FILE\n")
        fi
    fi
    
    if [[ "$(detect_os)" == "macos" ]]; then
        # En macOS lanzar el binario directamente (no via open -a)
        # para que los argumentos como -p y -c se pasen correctamente
        nohup "$RVM_PATH" "${cmd_args[@]}" > /dev/null 2>&1 &
        disown
    else
        nohup "$RVM_PATH" "${cmd_args[@]}" > /dev/null 2>&1 &
        disown
    fi
    
    sleep 1
    success "RetroVirtualMachine iniciado"
    echo ""
}
