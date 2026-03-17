# Life OS Starter

A plug & play Obsidian vault with AI agent support. Clone, install, start.

## Quick Start

### Windows

```powershell
git clone https://github.com/viggomeesters/life-os-starter.git
cd life-os-starter
powershell -ExecutionPolicy Bypass -File setup.ps1
```

### macOS

```bash
git clone https://github.com/viggomeesters/life-os-starter.git
cd life-os-starter
bash setup.sh
```

### After setup

1. **Set your API key** (get one at [platform.openai.com/api-keys](https://platform.openai.com/api-keys)):
   - Windows: `setx OPENAI_API_KEY sk-your-key-here` (then restart terminal)
   - macOS: `export OPENAI_API_KEY=sk-your-key-here` (add to `~/.zshrc`)

2. **Open in Obsidian**: Open Obsidian → "Open folder as vault" → select this folder

3. **Start your agent**: Open a terminal in this folder and type `codex`

## What's Inside

```
life-os-starter/
├── notes/          Task, meeting notes, journal entries
├── projects/       Project definitions
├── entities/       People, companies, places
├── resources/      Bookmarks, articles, references
├── inbox/          Quick captures
├── templates/      Note templates
├── AGENTS.md       Agent instructions (Codex CLI reads this)
└── schema.md       Frontmatter reference
```

## 5 Note Types

| Type | What | Example |
|------|------|---------|
| **task** | Something to do | "Next.js project opzetten" |
| **note** | A thought or meeting note | "Kickoff meeting met Quinten" |
| **project** | Groups related tasks | "Personal Website" |
| **entity** | A person or company | "Quinten de Vries" |
| **resource** | A bookmark or reference | "Portfolio Design Inspiratie" |

Every note has YAML frontmatter with `type`, `topics`, and `[[wikilinks]]` to connect things together.

## Try These Prompts

Once `codex` is running, try:

- "Maak een taak aan: deployment pipeline opzetten, p1, voor het personal-website project"
- "Welke taken staan er open?"
- "Maak een entity aan voor mijn collega Jan Bakker, developer bij Acme Agency"
- "Wat weet je over het personal-website project?"
- "Maak een meeting note van ons gesprek vandaag"

## How It Works

The `AGENTS.md` file teaches the AI agent your vault structure. When you run `codex` in this folder, it reads those instructions and can create, read, and update your notes — all as plain markdown files that sync with Obsidian.

## Learn More

- [Obsidian](https://obsidian.md) — The knowledge base app
- [Codex CLI](https://github.com/openai/codex) — OpenAI's terminal agent
- [CLI Agents Guide](https://viggomeestersnl.vercel.app/cli-agents-guide/) — Full guide on CLI agents
