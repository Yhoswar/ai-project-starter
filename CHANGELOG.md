# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-03-20

### Added
- `/init-project` interactive setup wizard — configures the entire project with one command
- `/load-context` command — loads all memory at session start
- `/save-context` command — saves all context at session end
- `/validate-setup` command — verifies project configuration
- `memory/changelog.md` — session-by-session history log
- `planning/`, `implementation/`, `tests/`, `mcps/` skeleton folders
- `_blueprints/` directory with all 3 production templates
- `START_PROJECT_PROMPT` — plain text fallback for non-CLI environments
- `strategist.md` agent — merged marketer + investigador into one optional agent
- `docs/architecture.md` — Mermaid architecture diagram
- `README.es.md` — Spanish README
- GitHub community files: issue templates, PR template, CONTRIBUTING.md
- Persistence Rules section in CLAUDE.md template
- Memory Protocol section in all agents

### Changed
- `templates/` renamed to `_blueprints/`
- `arquitecto.md` → `architect.md` (English naming)
- `revisor.md` → `reviewer.md` (English naming)
- `init-project.sh` and `init-project.ps1` simplified — now guide to `/init-project`
- `README.md` rewritten in English as primary language

### Removed
- `marketer.md` — merged into `strategist.md`
- `investigador.md` — merged into `strategist.md`
- `bun.lock` files from all blueprints (lockfiles should not be in templates)

## [1.0.0] - 2026-03-17

### Added
- Initial release
- 7 specialized agents (director, arquitecto, frontend, backend, marketer, investigador, revisor)
- 3 slash commands: `/team-plan`, `/team-status`, `/team-review`
- MEMORY.md persistent context system
- 3 production blueprints: next-saas, api-service, automation
- Dual platform support: Claude Code + OpenCode
- GitHub Actions CI/CD
- `init-project.sh` and `init-project.ps1` interactive scripts
- Skills ecosystem documentation
