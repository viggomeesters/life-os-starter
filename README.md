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
├── 10_notes/                All timestamped notes (tasks, interactions, entries, references)
├── 20_context/
│   ├── entity/              People, companies, places
│   ├── projects/            Project definitions
│   ├── anniversaries/       Birthdays, weddings, recurring dates
│   ├── chores/              Recurring household tasks
│   └── self/                Your profile, writing style (agent reads this)
├── templates/               15 note templates
├── 90_attachments/          Images, files
├── AGENTS.md                Agent instructions (Codex CLI reads this)
└── life-os-schema.md        Full schema specification (v8.5)
```

## 11 Note Types

| Type | What | Example |
|------|------|---------|
| **task** | Something to do | "Next.js project opzetten" |
| **interaction** | A call, meeting, or chat | "Kickoff meeting met Quinten" |
| **entry** | A journal entry or note | "Dagboek 17 maart" |
| **reference** | A bookmark or article | "Portfolio Design Inspiratie" |
| **project** | Groups related tasks | "Personal Website" |
| **entity** | A person or company | "Quinten de Vries" |
| **health** | A health log | Migraine, weight, blood pressure |
| **purchase** | Something you bought | Electronics, furniture |
| **anniversary** | A recurring date | Birthdays, weddings |
| **chore** | A recurring task | Weekly cleaning, daily routines |
| **context** | Personal background | Your profile, for the agent |

Every note has YAML frontmatter and uses `[[wikilinks]]` to connect things together.

## Try These Prompts

Once `codex` is running, try:

```
Maak een taak aan: deployment pipeline opzetten, p1, voor het personal-website project

Welke taken staan er open?

Log een meeting met Quinten — we hebben de vault structuur besproken

Maak een entity aan voor mijn collega Jan Bakker, developer bij Acme Agency

Wat weet je over het personal-website project? Welke taken hangen eraan?

Zoek alle notes met topic "webdev"

Markeer de taak "boodschappen doen" als done

Stel een e-mail op voor Jan over de planning van volgende week
```

## Personalize Your Vault

The agent reads `20_context/self/` to understand who you are:

- **`owner.md`** — Your name, role, tech stack, interests. Fill this in first.
- **`schrijfstijl.md`** — Your writing style for emails and messages. Add examples of how you write so the agent can match your tone.

## How It Works

The `AGENTS.md` file teaches the AI agent your vault structure and schema. When you run `codex` in this folder, it reads those instructions and can create, read, and update your notes — all as plain markdown files that sync with Obsidian.

The full schema is documented in `life-os-schema.md`, synced from [life-os-schema](https://github.com/viggomeesters/life-os-schema).

## Learn More

- [CLI Agents Guide](https://viggomeestersnl.vercel.app/cli-agents-guide/) — Full guide on CLI agents + Obsidian
- [Obsidian](https://obsidian.md) — The knowledge base app
- [Codex CLI](https://github.com/openai/codex) — OpenAI's terminal agent
- [Life OS Schema](https://github.com/viggomeesters/life-os-schema) — Full schema specification

## License

MIT
