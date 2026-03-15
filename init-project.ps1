# 🤖 AI Project Starter - Initialization Script (PowerShell)
# This script will help you set up your project with AI agent configuration

$ErrorActionPreference = "Stop"

Write-Host "🤖 AI Project Starter - Inicialización del Proyecto" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Function to replace placeholders in files
function Replace-Placeholder {
    param (
        [string]$FilePath,
        [string]$Placeholder,
        [string]$Value
    )

    $content = Get-Content $FilePath -Raw
    $content = $content -replace [regex]::Escape($Placeholder), $Value
    Set-Content -Path $FilePath -Value $content -NoNewline
}

# Collect project information
$PROJECT_NAME = Read-Host "📝 Nombre del proyecto (e.g., my-awesome-app)"
$PROJECT_DESCRIPTION = Read-Host "📝 Descripción del proyecto"
$WEBSITE_URL = Read-Host "🌐 URL del sitio web (opcional, presiona Enter para omitir)"
$CONTACT_EMAIL = Read-Host "📧 Email de contacto (opcional)"
$PREFERRED_LANGUAGE = Read-Host "🗣️  Idioma de respuesta preferido (español/inglés/otro)"
$PROJECT_TYPE = Read-Host "📱 Tipo de proyecto (React/PHP/Next.js/Python/otro)"
$MAIN_LANGUAGE = Read-Host "🌍 Idioma principal del contenido (español/inglés/otro)"

Write-Host ""
Write-Host "🔧 Configurando proyecto..." -ForegroundColor Yellow
Write-Host ""

# Set default values if empty
if ([string]::IsNullOrWhiteSpace($WEBSITE_URL)) { $WEBSITE_URL = "TBD" }
if ([string]::IsNullOrWhiteSpace($CONTACT_EMAIL)) { $CONTACT_EMAIL = "TBD" }

# Replace placeholders in CLAUDE.md
Replace-Placeholder -FilePath "CLAUDE.md" -Placeholder "{PROJECT_NAME}" -Value $PROJECT_NAME
Replace-Placeholder -FilePath "CLAUDE.md" -Placeholder "{PROJECT_DESCRIPTION}" -Value $PROJECT_DESCRIPTION
Replace-Placeholder -FilePath "CLAUDE.md" -Placeholder "{WEBSITE_URL}" -Value $WEBSITE_URL
Replace-Placeholder -FilePath "CLAUDE.md" -Placeholder "{PREFERRED_LANGUAGE}" -Value $PREFERRED_LANGUAGE
Replace-Placeholder -FilePath "CLAUDE.md" -Placeholder "{MAIN_LANGUAGE}" -Value $MAIN_LANGUAGE

# Replace placeholders in AGENTS.md
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{PROJECT_NAME}" -Value $PROJECT_NAME
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{PROJECT_DESCRIPTION}" -Value $PROJECT_DESCRIPTION
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{WEBSITE_URL}" -Value $WEBSITE_URL
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{CONTACT_EMAIL}" -Value $CONTACT_EMAIL
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{PREFERRED_LANGUAGE}" -Value $PREFERRED_LANGUAGE
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{MAIN_LANGUAGE}" -Value $MAIN_LANGUAGE
Replace-Placeholder -FilePath "AGENTS.md" -Placeholder "{CURRENT_DATE}" -Value (Get-Date -Format "yyyy-MM-dd")

# Replace placeholders in .claude/settings.local.json
Replace-Placeholder -FilePath ".claude/settings.local.json" -Placeholder "{PREFERRED_LANGUAGE}" -Value $PREFERRED_LANGUAGE
Replace-Placeholder -FilePath ".claude/settings.local.json" -Placeholder "{PROJECT_TYPE}" -Value $PROJECT_TYPE

# Replace placeholders in .opencode/package.json
Replace-Placeholder -FilePath ".opencode/package.json" -Placeholder "{PROJECT_NAME}" -Value $PROJECT_NAME

Write-Host "✅ Archivos de configuración actualizados" -ForegroundColor Green
Write-Host ""

# Install OpenCode dependencies
Write-Host "📦 Instalando dependencias de OpenCode..." -ForegroundColor Yellow
Set-Location .opencode

try {
    if (Get-Command npm -ErrorAction SilentlyContinue) {
        npm install
        Write-Host "✅ Dependencias instaladas con npm" -ForegroundColor Green
    }
    elseif (Get-Command bun -ErrorAction SilentlyContinue) {
        bun install
        Write-Host "✅ Dependencias instaladas con bun" -ForegroundColor Green
    }
    elseif (Get-Command yarn -ErrorAction SilentlyContinue) {
        yarn install
        Write-Host "✅ Dependencias instaladas con yarn" -ForegroundColor Green
    }
    else {
        Write-Host "⚠️  No se encontró npm, bun ni yarn. Instala las dependencias manualmente." -ForegroundColor Yellow
    }
}
finally {
    Set-Location ..
}

Write-Host ""
Write-Host "✅ ¡Proyecto inicializado correctamente!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Próximos pasos:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. [ ] Instalar Claude Code Skills globales (si no los tienes):"
Write-Host "       - superpowers@superpowers-marketplace"
Write-Host "       - claude-mem@thedotmack"
Write-Host "       - frontend-design@claude-plugins-official (si aplica)"
Write-Host ""
Write-Host "2. [ ] Personalizar CLAUDE.md:"
Write-Host "       - Completar placeholders restantes {PLACEHOLDER}"
Write-Host "       - Agregar detalles específicos del proyecto"
Write-Host "       - Documentar arquitectura y convenciones"
Write-Host ""
Write-Host "3. [ ] Personalizar AGENTS.md:"
Write-Host "       - Completar stack tecnológico real"
Write-Host "       - Documentar estructura de archivos"
Write-Host "       - Agregar comandos útiles"
Write-Host ""
Write-Host "4. [ ] Crear .claude/agents.md (copia de AGENTS.md o versión específica)"
Write-Host ""
Write-Host "5. [ ] Crear skills personalizados en .claude/skills/"
Write-Host ""
Write-Host "6. [ ] Crear slash commands en .claude/commands/"
Write-Host ""
Write-Host "7. [ ] Configurar permisos en .claude/settings.local.json"
Write-Host ""
Write-Host "8. [ ] (Opcional) Configurar MCP servers si es necesario"
Write-Host ""
Write-Host "9. [ ] Inicializar Git (si aún no lo has hecho):"
Write-Host "       git init"
Write-Host "       git add ."
Write-Host "       git commit -m 'Initial commit with AI configuration'"
Write-Host ""
Write-Host "📚 Documentación: https://docs.claude.com/en/docs/claude-code" -ForegroundColor Cyan
Write-Host ""
Write-Host "🎉 ¡Listo para empezar a desarrollar con Claude Code!" -ForegroundColor Green
