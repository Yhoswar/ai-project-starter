$ErrorActionPreference = "Stop"

if ($env:SKILLS_ROOT) {
  $SourceDir = $env:SKILLS_ROOT
} else {
  $SourceDir = "$env:USERPROFILE\OneDrive\Desktop\Claude\claude-skills"
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

$answer = Read-Host "  Install dream (grandamenium/dream-skill — auto-memory consolidation)? [y/N]"
if ($answer -match "^[Yy]$") {
  $DreamDest = Join-Path $GitSkillsDir "dream"
  if (Test-Path $DreamDest) {
    Write-Host "  OK (already installed): dream"
  } else {
    git clone --depth 1 https://github.com/grandamenium/dream-skill.git $DreamDest
    Write-Host "  INSTALLED: dream"
    Write-Host "  NOTE: dream requires Stop hook in ~/.claude/settings.json + instruction in ~/.claude/CLAUDE.md. See README."
  }
}

$answer = Read-Host "  Install gstack (garrytan/gstack — 62 skills: eng team + marketing/CRO)? [y/N]"
if ($answer -match "^[Yy]$") {
  $GstackDest = Join-Path $GitSkillsDir "gstack"
  if (Test-Path $GstackDest) {
    Write-Host "  OK (already installed): gstack"
  } else {
    git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git $GstackDest
    Push-Location $GstackDest
    bash ./setup
    Pop-Location
    Write-Host "  INSTALLED: gstack (requires Bun + Node.js for /browse)"
  }
}

Write-Host "`nDone! Restart Claude Code for changes to take effect."
