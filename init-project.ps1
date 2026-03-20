# ai-project-starter — Project Initialization
# ============================================
# Recommended: Use /init-project in Claude Code for a better experience.
# This script is a fallback for environments without Claude Code.

Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║      AI Project Starter — Setup          ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Check if Claude Code is available
$claudeAvailable = Get-Command claude -ErrorAction SilentlyContinue

if ($claudeAvailable) {
    Write-Host "✅ Claude Code detected!" -ForegroundColor Green
    Write-Host ""
    Write-Host "For the best experience, use the interactive wizard:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  1. Open Claude Code in this directory"
    Write-Host "  2. Run: /init-project"
    Write-Host ""
    Write-Host "The /init-project command will:"
    Write-Host "  • Ask you about your project interactively"
    Write-Host "  • Configure CLAUDE.md and AGENTS.md automatically"
    Write-Host "  • Set up your memory system"
    Write-Host "  • Generate appropriate .gitignore"
    Write-Host "  • Create your first sprint plan"
    Write-Host ""
    $response = Read-Host "Open Claude Code now? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        claude .
        exit
    }
}

# Basic fallback setup
Write-Host "Running basic setup..." -ForegroundColor Yellow
Write-Host ""

$PROJECT_NAME = Read-Host "Project name"
$TODAY = Get-Date -Format "yyyy-MM-dd"

# Replace placeholders in key files
if (Test-Path "CLAUDE.md") {
    (Get-Content "CLAUDE.md") -replace '\{PROJECT_NAME\}', $PROJECT_NAME -replace '\{CURRENT_DATE\}', $TODAY | Set-Content "CLAUDE.md"
    Write-Host "✅ CLAUDE.md configured" -ForegroundColor Green
}

if (Test-Path "AGENTS.md") {
    (Get-Content "AGENTS.md") -replace '\{PROJECT_NAME\}', $PROJECT_NAME -replace '\{CURRENT_DATE\}', $TODAY | Set-Content "AGENTS.md"
    Write-Host "✅ AGENTS.md configured" -ForegroundColor Green
}

if (Test-Path "memory/MEMORY.md") {
    (Get-Content "memory/MEMORY.md") -replace '\{PROJECT_NAME\}', $PROJECT_NAME | Set-Content "memory/MEMORY.md"
    Write-Host "✅ memory/MEMORY.md configured" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Basic setup complete for: $PROJECT_NAME" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Claude Code: claude ."
Write-Host "  2. Run: /init-project  (for full configuration)"
Write-Host "  3. Or read START_PROJECT_PROMPT for manual setup"
Write-Host ""
