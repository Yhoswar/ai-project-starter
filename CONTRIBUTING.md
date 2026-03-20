# Contributing to AI Project Starter

Thank you for your interest in contributing! This template is used by developers worldwide, so your improvements have real impact.

## Ways to Contribute

- 🐛 **Bug reports** — Something broken? [Open an issue](https://github.com/Yhoswar/ai-project-starter/issues)
- 💡 **Feature requests** — New idea? [Open an issue](https://github.com/Yhoswar/ai-project-starter/issues) with `[feature]` prefix
- 📝 **Documentation** — Improve guides, fix typos, add examples
- 🔧 **Code** — Fix bugs, add features (see below)
- 🌐 **Translations** — Add README in your language

## Development Setup

```bash
git clone https://github.com/Yhoswar/ai-project-starter.git
cd ai-project-starter
claude .  # Open in Claude Code
```

## Pull Request Process

1. **Fork** the repository
2. **Create a branch**: `git checkout -b feat/your-feature` or `fix/your-bug`
3. **Make your changes**
4. **Test**: Verify your changes work with a fresh clone
5. **Commit**: Use conventional commits (see below)
6. **Push**: `git push origin feat/your-feature`
7. **Open PR**: Against the `main` branch

## Commit Convention

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add new feature
fix: fix a bug
docs: update documentation
chore: maintenance tasks
refactor: code restructuring (no feature change)
```

Examples:
```
feat: add /debug-session command
fix: validate-setup now detects Python projects
docs: add French README translation
chore: remove bun.lock from blueprints
```

## What Makes a Good Contribution

### For new agents:
- Clear role definition (what they do AND what they don't do)
- Memory protocol included
- Works in both `.claude/agents/` and `.opencode/agents/`
- English filename (role.md)

### For new slash commands:
- Clear instructions for Claude (not for the user)
- Handles edge cases
- Works standalone (no dependency on other commands)
- Mirror to `.opencode/commands/`

### For new blueprints:
- Production-ready (not a toy example)
- No lockfiles
- Includes README with stack description
- Tested by cloning fresh and running

### For documentation:
- Concise (developers skim docs)
- Code examples where helpful
- Keep README.md and README.es.md in sync

## Code of Conduct

Be respectful, constructive, and helpful. That's it.

## Questions?

Open an issue with `[question]` prefix — happy to help.
