$ErrorActionPreference = "Stop"

if ($env:SKILLS_ROOT) {
  $SourceDir = $env:SKILLS_ROOT
} else {
  $SourceDir = "$env:USERPROFILE\OneDrive\Desktop\Claude Skills"
}

$DestDir = "$env:USERPROFILE\.claude\plugins\local-skills"

Write-Host "Claude Code Skills Installer"
Write-Host "Source: $SourceDir"
Write-Host "Destination: $DestDir"

if (-not (Test-Path $SourceDir)) {
  Write-Error "ERROR: Skills folder not found at: $SourceDir. Set SKILLS_ROOT and retry."
  exit 1
}

$CoreSkills = @("security","scalability","frontend-design","researcher","know-me","self-healing")
$OptionalSkills = @("trigger-dev","composio","n8n","cost-reducer","customer-support","create-skill")

if (-not (Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir -Force | Out-Null }

function Install-Skill {
  param([string]$Skill)
  $Src = Join-Path $SourceDir $Skill
  $Dest = Join-Path $DestDir $Skill
  if (-not (Test-Path $Src)) { Write-Host "  SKIP: $Skill (not found)"; return }
  if (Test-Path $Dest) { Write-Host "  OK (already installed): $Skill"; return }
  Copy-Item -Recurse $Src $Dest
  Write-Host "  INSTALLED: $Skill"
}

Write-Host "`nInstalling core skills..."
foreach ($skill in $CoreSkills) { Install-Skill $skill }

Write-Host "`nOptional skills:"
foreach ($skill in $OptionalSkills) {
  $answer = Read-Host "  Install $skill? [y/N]"
  if ($answer -match "^[Yy]$") { Install-Skill $skill }
}

Write-Host "`nDone! Restart Claude Code for changes to take effect."
