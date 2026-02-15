#!/usr/bin/env bash
# ==============================================================================
# DevCPC CLI - Sistema de compilación para Amstrad CPC
# Copyright (c) 2026 Destroyer
# compile_bas.sh - Compilación de código BASIC con ABASC
# ==============================================================================
# shellcheck disable=SC2155

# Cargar utilidades si no están cargadas
if [[ -z "$(type -t register_in_map)" ]]; then
    source "${DEVCPC_LIB:-$(dirname "$0")}/utils.sh"
fi

compile_bas() {
    if [[ -z "$BAS_SOURCE" ]]; then
        return 0
    fi
    
    # Buscar el archivo en BASIC_PATH o en el directorio actual
    local bas_file=""
    if [[ -n "$BASIC_PATH" && -f "$BASIC_PATH/$BAS_SOURCE" ]]; then
        bas_file="$BASIC_PATH/$BAS_SOURCE"
    elif [[ -f "$BAS_SOURCE" ]]; then
        bas_file="$BAS_SOURCE"
    else
        error "Archivo BASIC no encontrado: $BAS_SOURCE"
        return 1
    fi
    
    # Verificar Python
    local python_cmd=$(command -v python3 || command -v python)
    if [[ -z "$python_cmd" ]]; then
        error "Python 3 no está instalado"
        return 1
    fi
    
    # Verificar ABASC
    local abasc_path="$DEVCPC_CLI_ROOT/tools/abasc/src/abasc.py"
    if [[ ! -f "$abasc_path" ]]; then
        error "ABASC no encontrado: $abasc_path"
        return 1
    fi
    
    # Verificar ABASM
    local abasm_path="$DEVCPC_CLI_ROOT/tools/abasm/src/abasm.py"
    if [[ ! -f "$abasm_path" ]]; then
        error "ABASM no encontrado: $abasm_path"
        return 1
    fi
    
    header "Compilar BASIC con ABASC"
    
    local basename=$(basename "$BAS_SOURCE" .bas)
    local load_addr="$BAS_LOADADDR"
    
    # Convertir dirección si es necesario
    if [[ ! "$load_addr" =~ ^0x ]]; then
        load_addr="0x$load_addr"
    fi
    
    info "Archivo:    $BAS_SOURCE"
    info "Dirección:  $load_addr"
    info "ABASC:      $abasc_path"
    echo ""
    
    # Limpiar archivos anteriores
    step "Limpiando archivos anteriores..."
    rm -f "$OBJ_DIR/$basename".* 2>/dev/null || true
    
    # Compilar con ABASC (que internamente llama a ABASM)
    step "Compilando BASIC con ABASC..."
    echo ""
    
    local abasc_output
    if abasc_output=$($python_cmd "$abasc_path" "$bas_file" -o "$OBJ_DIR/$basename" 2>&1); then
        echo "$abasc_output"
        
        if [[ ! -f "$OBJ_DIR/$basename.bin" ]]; then
            error "Error: No se generó $basename.bin"
            return 1
        fi
        
        success "Compilación ABASC exitosa"
        echo ""
    else
        error "Error en compilación ABASC:"
        echo "$abasc_output"
        return 1
    fi
    
    # Añadir al DSK
    step "Añadiendo binario BASIC al DSK..."
    
    local dsk_tool="$DEVCPC_CLI_ROOT/tools/abasm/src/dsk.py"
    local dsk_path="$DIST_DIR/$DSK"
    
    if (cd "$OBJ_DIR" && $python_cmd "$dsk_tool" "$(pwd)/../$dsk_path" --put-bin "$basename.bin" --load-addr "$load_addr" --start-addr "$load_addr" > /dev/null 2>&1); then
        success "Binario BASIC añadido al DSK: $basename.bin"
        
        # Registrar en map.cfg
        register_in_map "$basename.bin" "bin" "$load_addr" "$load_addr"
        
        echo ""
        info "Para ejecutar desde BASIC:"
        info "  CALL $load_addr"
        echo ""
        
        return 0
    else
        error "Error al añadir binario al DSK"
        return 1
    fi
}
