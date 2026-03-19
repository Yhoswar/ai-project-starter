$ErrorActionPreference = "Stop"

if ($env:SKILLS_ROOT) {
  $SourceDir = $env:SKILLS_ROOT
} else {
  $SourceDir = "$env:USERPROFILE\OneDrive\Desktop\Claude Skills"
}

$DestDir = "$env:USERPROFILE\.claude\skills"

Write-Host "Claude Code Skills Installer"
Write-Host "Source: $SourceDir"
Write-Host "Destination: $DestDir"

if (-not (Test-Path $SourceDir)) {
  Write-Error "ERROR: Skills folder not found at: $SourceDir. Set SKILLS_ROOT and retry."
  exit 1
}

$CoreSkills = @("security", "researcher", "self-healing", "cost-reducer")
$OptionalSkills = @("frontend-design")

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

# PART 1: Core skills
Write-Host "`nInstalling core skills..."
foreach ($skill in $CoreSkills) { Install-Skill $skill }

# PART 2: Optional skills
Write-Host "`nOptional skills:"
foreach ($skill in $OptionalSkills) {
  $answer = Read-Host "  Install $skill? [y/N]"
  if ($answer -match "^[Yy]$") { Install-Skill $skill }
}

# PART 3: Git-cloned skills
Write-Host "`nGit-cloned skills (require git):"
$GitSkillsDir = "$env:USERPROFILE\.claude\skills"

$answer = Read-Host "  Install humanizer (blader/humanizer)? [y/N]"
if ($answer -match "^[Yy]$") {
  $HumanizerDest = Join-Path $GitSkillsDir "humanizer"
  if (Test-Path $HumanizerDest) {
    Write-Host "  OK (already installed): humanizer"
  } else {
    git clone --depth 1 https://github.com/blader/humanizer.git $HumanizerDest
    Write-Host "  INSTALLED: humanizer"
  }
}

Write-Host "`nDone! Restart Claude Code for changes to take effect."
