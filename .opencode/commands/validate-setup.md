# Validate Setup

Verifies the project is correctly configured after running `/init-project`.

## Instructions for Claude:

When the user runs `/validate-setup`, perform these checks:

### Check 1: CLAUDE.md has no placeholders
Read `CLAUDE.md` and search for any `{...}` patterns (unfilled placeholders).
- ✅ No placeholders found
- ❌ Found placeholders: list them and tell user to fill them in

### Check 2: AGENTS.md is configured
Read `AGENTS.md` and verify:
- Project name is set (not a placeholder)
- Architecture section has real content (not just "TODO")
- ✅ Configured / ❌ Still has template placeholders

### Check 3: .gitignore is appropriate
Read `.gitignore` and verify it has:
- `node_modules/` (if a JS project)
- `.env` or `.env.local` (secrets protection)
- ✅ Appropriate / ⚠️ Missing important entries: [list]

### Check 4: Basic structure exists
Check that at minimum these exist:
- `memory/MEMORY.md`
- `memory/sprint.md`
- `.gitignore`
- `CLAUDE.md`
- `AGENTS.md`
- ✅ All present / ❌ Missing: [list missing files]

### Check 5: Git is initialized with commits
Run `git log --oneline -5` and verify there are commits.
- ✅ Git initialized with [N] commits
- ❌ No commits yet — run: git init && git add -A && git commit -m "feat: initial project setup"

### Report format:
```
## 🔍 Setup Validation Report

| Check | Status | Notes |
|-------|--------|-------|
| CLAUDE.md placeholders | ✅/❌ | ... |
| AGENTS.md configured | ✅/❌ | ... |
| .gitignore appropriate | ✅/⚠️ | ... |
| Basic structure | ✅/❌ | ... |
| Git initialized | ✅/❌ | ... |

**Overall:** ✅ Ready to build! / ⚠️ Fix the issues above before starting.
```
