# Load Context

Run this command at the start of each work session to recover all project context.

## What this does:
1. Reads all memory/ files
2. Reads CLAUDE.md and AGENTS.md configuration
3. Presents an executive summary of the project state
4. Asks how to proceed

## Instructions for Claude:

When the user runs `/load-context`:

1. **Read all context files:**
   - `memory/MEMORY.md`
   - `memory/sprint.md`
   - `memory/issues.md`
   - `memory/changelog.md` (last 3 entries)
   - `CLAUDE.md`
   - `AGENTS.md`

2. **Present executive summary:**
```
## Context Loaded — [PROJECT_NAME]

**Project:** [one line description from MEMORY.md]
**Last session:** [date from changelog.md]
**Last session did:** [summary from changelog.md]

### Current Sprint
[paste In Progress and Blocked items from sprint.md]

### Active Issues
[count and list critical/important issues from issues.md]

### Architecture snapshot
[key decisions from decisions.md, max 3 most recent]
```

3. **Ask:** "Ready to continue. Should we pick up where we left off, or is there something new to work on?"

4. Wait for user response before starting any implementation.
