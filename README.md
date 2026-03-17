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

2. **Fill in your profile**: Edit `20_context/self/owner.md` with your name, role, and interests

3. **Open in Obsidian**: Open Obsidian → "Open folder as vault" → select this folder

4. **Start your agent**: Open a terminal in this folder and type `codex`

## What's Inside

```
life-os-starter/
├── 10_notes/                    All timestamped notes (tasks, interactions, entries, references)
├── 20_context/
│   ├── entity/                  People, companies, places
│   ├── projects/                Project definitions
│   ├── anniversaries/           Birthdays, weddings, recurring dates
│   ├── chores/                  Recurring household tasks
│   ├── self/                    Your profile, writing style (agent reads this)
│   ├── templates/               15 note templates
│   └── life-os-schema.md        Full schema specification (v8.5)
├── 90_attachments/              Images, files
└── AGENTS.md                    Agent instructions (Codex CLI reads this)
```

## 11 Note Types

| Type | What | Example |
|------|------|---------|
| **task** | Something to do | "Set up Next.js project" |
| **interaction** | A call, meeting, or chat | "Kickoff meeting with Jane" |
| **entry** | A journal entry or note | "Journal March 17" |
| **reference** | A bookmark or article | "Portfolio Design Inspiration" |
| **project** | Groups related tasks | "Personal Website" |
| **entity** | A person or company | "Jane Smith" |
| **health** | A health log | Migraine, weight, blood pressure |
| **purchase** | Something you bought | Electronics, furniture |
| **anniversary** | A recurring date | Birthdays, weddings |
| **chore** | A recurring task | Weekly cleaning, daily routines |
| **context** | Personal background | Your profile, for the agent |

Every note has YAML frontmatter and uses `[[wikilinks]]` to connect things together.

## Try These Prompts

Once `codex` is running, try:

```
Create a task: set up deployment pipeline, p1, for the personal-website project

What tasks are open?

Log a meeting with Jane — we discussed the vault structure

Create an entity for my colleague John Baker, developer at Example Company

What do you know about the personal-website project? What tasks are linked to it?

Find all notes with topic "webdev"

Mark the task "get groceries" as done

Draft an email to John about next week's planning
```

## Personalize Your Vault

The agent reads `20_context/self/` to understand who you are:

- **`owner.md`** — Your name, role, tech stack, interests. Fill this in first.
- **`schrijfstijl.md`** — Your writing style for emails and messages. Add examples of how you write so the agent can match your tone.

## How It Works

The `AGENTS.md` file teaches the AI agent your vault structure and schema. When you run `codex` in this folder, it reads those instructions and can create, read, and update your notes — all as plain markdown files that sync with Obsidian.

The full schema is documented in `20_context/life-os-schema.md`, synced from [life-os-schema](https://github.com/viggomeesters/life-os-schema).

## Learn More

- [CLI Agents Guide](https://viggomeestersnl.vercel.app/cli-agents-guide/) — Full guide on CLI agents + Obsidian
- [Obsidian](https://obsidian.md) — The knowledge base app
- [Codex CLI](https://github.com/openai/codex) — OpenAI's terminal agent
- [Life OS Schema](https://github.com/viggomeesters/life-os-schema) — Full schema specification

## License

MIT
