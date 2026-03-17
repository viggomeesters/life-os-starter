# Life OS — Agent Instructions

You are working inside an Obsidian vault that serves as a personal knowledge base, task manager, and CRM.

For the full schema specification, read `life-os-schema.md` in this repo.

## Vault Structure

| Folder | What goes here | Filename pattern |
|--------|---------------|-----------------|
| `notes/` | All timestamped notes (tasks, interactions, entries, references, health, purchases) | `YYYYMMDD-HHmm-slug.md` |
| `entities/` | People, companies, pets, products, places | `slug.md` |
| `projects/` | Project definitions | `YYYY-MM-slug.md` |
| `anniversaries/` | Recurring dates (birthdays, weddings) | `MM-DD-category-entity.md` |
| `chores/` | Recurring household tasks | `category-frequency-slug.md` |
| `self/` | Personal context docs | `slug.md` |
| `templates/` | Note templates (do not modify) | — |
| `attachments/` | Images, files | — |

## 11 Note Types

| Type | Purpose | Location | Key fields |
|------|---------|----------|------------|
| `entity` | People, companies, products | `entities/` | `category`, `first_name`, `last_name`, `contact_frequency` |
| `interaction` | Calls, meetings, chats, mail | `notes/` | `category` (call/irl/chat/mail/letter), `entity` (required) |
| `task` | Actions to complete | `notes/` | `status`, `area`, `project`, `entity`, `due` |
| `project` | Container for tasks | `projects/` | `status`, `area`, `start_date` |
| `reference` | Bookmarks, articles, books, media | `notes/` | `category`, `url` |
| `entry` | Journals, notes, reflections | `notes/` | `category` (daily/weekly/note/reflection) |
| `health` | Migraine, weight, blood pressure | `notes/` | `category`, `date` |
| `purchase` | Items bought | `notes/` | `amount`, `store` |
| `anniversary` | Recurring dates | `anniversaries/` | `entity`, `date`, `recurring` |
| `chore` | Recurring household tasks | `chores/` | `nature`, `frequency`, `duration` |
| `context` | Personal background docs | `self/` | (freeform) |

## Core Frontmatter Fields

Every note MUST have:

```yaml
type: string          # One of the 11 types above
category: string      # Type-specific variant
created: YYYY-MM-DD   # When created
slug: string          # Unique kebab-case identifier
timestamp: YYYYMMDD-HHmm  # Exact creation time
title: "string"       # Human-readable title
topics: []            # Discovery keywords
```

Recommended context fields:

```yaml
area: string          # work | home | self | social
project: string       # Project slug (for tasks/interactions)
entity: []            # Linked entity slugs (always array)
```

## Status Values (tasks and projects only)

| Status | Meaning |
|--------|---------|
| `🔴 to-do` | Not started |
| `🟠 in progress` | Actively working |
| `🔵 waiting` | Blocked/external |
| `🟢 done` | Completed |
| `🟣 backlog` | Future consideration |
| `⚫ cancelled` | Aborted |

## Linking Rules

- Use `[[wikilinks]]` for all internal cross-references: `[[quinten-de-vries]]`, `[[2026-03-personal-website]]`
- Never use markdown links for internal notes
- The `project` field links to a project slug: `project: 2026-03-personal-website`
- The `entity` field is always an array: `entity: [quinten-de-vries]`
- The `topics` field enables discovery: `topics: [typescript, frontend, review]`
- Notes in `notes/` link by full filename: `[[20260317-1000-setup-nextjs-project]]`
- Entities and projects link by slug: `[[quinten-de-vries]]`, `[[2026-03-personal-website]]`

## Task Status Timeline

Tasks track status changes in the body using H2 headers:

```markdown
## 🔴 to-do - 17 Mar 2026 at 10:00
Created the task

## 🟠 in progress - 18 Mar 2026 at 09:15
Started working on it
```

The last H2 status header determines the current status.

## Rules

1. Always use frontmatter on every note you create — refer to `life-os-schema.md` for the full field spec
2. Use `[[wikilinks]]` for cross-references, never markdown links for internal notes
3. Write in the user's language (default: Dutch) unless asked otherwise
4. When creating tasks, set `status: 🔴 to-do` and include a `## 🔴 to-do` section in the body
5. When completing tasks, update status to `🟢 done` and add a `## 🟢 done` section with what was done
6. Keep the `topics` field populated — it's how notes are discovered later
7. Never delete notes — update status to `🟢 done` or `⚫ cancelled`
8. When creating interactions, always include `entity` (required field)
9. After making changes, commit with a descriptive message

## Common Mistakes to Avoid

- Do NOT create new folders — all timestamped notes go in `notes/`
- Do NOT use markdown links (`[text](path)`) for internal notes — use `[[wikilinks]]`
- Do NOT put entity/project slugs in note filenames — that info lives in frontmatter
- Do NOT forget the `entity` field on interactions — it's required for contact tracking
- Do NOT store status on note types other than `task` and `project`

## How to Search the Vault

- Find notes by type: search for `type: task` in frontmatter
- Find notes by topic: search for keywords in `topics` arrays
- Find notes by entity: search for entity slugs in `entity` fields
- Find overdue tasks: look for `due:` dates before today with `status: 🔴 to-do`
- Find project tasks: search for `project: <slug>` across notes
