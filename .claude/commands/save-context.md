# Save Context

Run this command at the end of each work session to preserve all context.

## What this does:
1. Summarizes what was accomplished in this session
2. Updates all memory/ files
3. Shows a project state snapshot
4. Suggests next steps for the next session

## Instructions for Claude:

When the user runs `/save-context`:

1. **Summarize the session** — Review the conversation and list:
   - What was implemented or changed (bullet points)
   - Decisions made and why
   - Any problems encountered

2. **Update memory files:**
   - `memory/MEMORY.md` — Update the "Last updated" and "Recent activity" sections
   - `memory/decisions.md` — Add any new architectural decisions from this session
   - `memory/issues.md` — Add new issues found, mark resolved ones as done
   - `memory/sprint.md` — Update task statuses based on what was done
   - `memory/changelog.md` — Add a new entry with today's date and session summary

3. **Show snapshot:**
```
## Session Snapshot — [DATE]
**Accomplished:** [bullet list]
**Decisions:** [bullet list or "none"]
**Open issues:** [count from issues.md]
**Sprint status:** [X/Y tasks done]
```

4. **Suggest next steps** — Based on sprint.md and what's incomplete, list 3 specific next actions.

5. Say: "Context saved. Run `/load-context` at the start of your next session."
