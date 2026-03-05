# Agente IA de DevCPC-Agent

Este directorio contiene el **custom agent** de DevCPC para GitHub Copilot en VS Code.

## 📄 Archivo

- **`devcpc-agent.agent.md`** - Agente IA especializado en DevCPC CLI

## 🎯 ¿Qué hace?

El agente proporciona asistencia experta en:
- Configuración de proyectos (`devcpc.conf`)
- Comandos DevCPC (`new`, `build`, `run`, `validate`, etc.)
- Troubleshooting de errores
- Optimización de memoria y rendimiento
- Conversión de gráficos (PNG → ASM/SCN)
- Generación de DSK, CDT y CPR

## 🔌 MCP requerido

- Servidor MCP: `devcpc`
- Backend Node: `${workspaceFolder}/mcp-node/server.js`
- Nombre del servidor MCP: `DevCPC-AI`

## 🚀 Uso

### Automático (nivel proyecto)

Este archivo se detecta automáticamente cuando abres un proyecto DevCPC en VS Code:

1. Abre VS Code en el directorio del proyecto
2. Abre el Chat de Copilot (`Ctrl+Alt+I` / `Cmd+Alt+I`)
3. Selecciona **"DevCPC-Agent"** del selector de agentes
4. ¡Pregunta lo que necesites!

### Instalación global (opcional)

Para usar el agente en **todos** tus proyectos DevCPC:

```bash
# Ejecutar script de instalación
.github/install-agent.sh

# O manualmente:
mkdir -p ~/.devcpc/agents
cp .github/agents/devcpc-agent.agent.md ~/.devcpc/agents/

# Configurar VS Code (settings.json):
{
  "chat.agentFilesLocations": {
    "~/.devcpc/agents": true
  }
}
```

## 💬 Ejemplos de uso

```
@DevCPC-Agent ¿Cómo creo un juego de plataformas con 8BP?

@DevCPC-Agent Mi código excede el límite de memoria, ¿qué hago?

@DevCPC-Agent ¿Cómo genero una cinta CDT con mi loader BASIC?

@DevCPC-Agent Error: "_END_GRAPH excede 42040"

@DevCPC-Agent Dame un ejemplo de devcpc.conf para un shooter
```

## 📚 Documentación

- **Guía completa**: [AGENT_INSTALLATION.md](../AGENT_INSTALLATION.md)
- **Documentación oficial**: [VS Code Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents)

## 🔧 Requisitos

- **VS Code** v1.106 o superior
- **GitHub Copilot** activo

## ℹ️ Formato del archivo

El archivo `devcpc-agent.agent.md` usa el formato oficial de VS Code Custom Agents:

- **Header (YAML frontmatter)**: Metadatos del agente (nombre, herramientas, descripción)
- **Body (Markdown)**: Instrucciones completas para el agente IA

## 🔄 Actualizar

Cuando DevCPC se actualice:

```bash
# Si está instalado globalmente
cp .github/agents/devcpc-agent.agent.md ~/.devcpc/agents/

# Recargar VS Code
# Command Palette → "Developer: Reload Window"
```

## 🐛 Troubleshooting

**El agente no aparece:**
- Verifica que GitHub Copilot esté instalado y activo
- Recarga VS Code: Command Palette → "Developer: Reload Window"
- Verifica diagnósticos: Chat → clic derecho → "Diagnostics"

**El agente no responde bien:**
- Asegúrate de tener la última versión de DevCPC
- Actualiza el archivo del agente
- Recarga VS Code

## 📞 Soporte

- **Issues**: https://github.com/destroyer-dcf/CPCDevKit/issues
- **Documentación DevCPC**: [README.md](../../README.md)
