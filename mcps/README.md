# MCP Servers & CLI Tools

Model Context Protocol server configurations and complementary CLI tools for this project.

---

## MCP Servers

Place your MCP server configuration files in this folder. Each MCP server should have its own file (e.g., `my-server.json`).

---

## Complementary CLI Tools

These are command-line tools that complement the AI workflow. They are not MCP servers, but can be invoked directly by agents via Bash.

### Google Workspace CLI (`gws`)

A CLI for interacting with Google Workspace APIs (Drive, Sheets, Gmail, Calendar, and more).

- **Repo:** https://github.com/googleworkspace/cli
- **Package:** `@googleworkspace/cli`
- **Status:** Global installation (not a MCP server)

**Install:**

```bash
npm install -g @googleworkspace/cli
```

**Authenticate (OAuth2):**

```bash
gws auth login
```

Credentials are stored at `~/.config/gws/credentials.enc`.

**Basic usage:**

```bash
# List Drive files
gws drive files list --params '{"pageSize": 10}'

# Read a spreadsheet
gws sheets spreadsheets get --params '{"spreadsheetId": "YOUR_ID"}'

# List Gmail messages
gws gmail users messages list --params '{"userId": "me"}'

# List Calendar events
gws calendar events list --params '{"calendarId": "primary"}'

# Explore available services
gws --help
```

**Services available:** `drive`, `sheets`, `gmail`, `calendar`, `admin`, `docs`, `forms`, `tasks`, `meet`, and more.

> **Note:** `gws` is a CLI tool. To use it as part of an AI agent workflow, invoke it via Bash commands. It is not configured as an MCP server.
