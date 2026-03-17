# Life OS — Agent Instructions

You are working inside an Obsidian vault that serves as a personal knowledge base, task manager, and CRM.

**Before doing anything**, read these files for context:
- `20_context/life-os-schema.md` — full schema specification for all 11 note types
- `20_context/self/owner.md` — who the vault owner is
- `20_context/self/schrijfstijl.md` — writing style for drafting messages

## Vault Structure

| Folder | What goes here | Filename pattern |
|--------|---------------|-----------------|
| `10_notes/` | All timestamped notes (tasks, interactions, entries, references, health, purchases) | `YYYYMMDD-HHmm-slug.md` |
| `20_context/entity/` | People, companies, pets, products, places | `slug.md` |
| `20_context/projects/` | Project definitions | `YYYY-MM-slug.md` |
| `20_context/anniversaries/` | Recurring dates (birthdays, weddings) | `MM-DD-category-entity.md` |
| `20_context/chores/` | Recurring household tasks | `category-frequency-slug.md` |
| `20_context/self/` | Personal context docs (owner profile, writing style) | `slug.md` |
| `20_context/templates/` | Note templates (do not modify) | — |
| `90_attachments/` | Images, files | — |

## 11 Note Types

| Type | Purpose | Location | Key fields |
|------|---------|----------|------------|
| `entity` | People, companies, products | `20_context/entity/` | `category`, `first_name`, `last_name`, `contact_frequency` |
| `interaction` | Calls, meetings, chats, mail | `10_notes/` | `category` (call/irl/chat/mail/letter), `entity` (required) |
| `task` | Actions to complete | `10_notes/` | `status`, `area`, `project`, `entity`, `due` |
| `project` | Container for tasks | `20_context/projects/` | `status`, `area`, `start_date` |
| `reference` | Bookmarks, articles, books, media | `10_notes/` | `category`, `url` |
| `entry` | Journals, notes, reflections | `10_notes/` | `category` (daily/weekly/note/reflection) |
| `health` | Migraine, weight, blood pressure | `10_notes/` | `category`, `date` |
| `purchase` | Items bought | `10_notes/` | `amount`, `store` |
| `anniversary` | Recurring dates | `20_context/anniversaries/` | `entity`, `date`, `recurring` |
| `chore` | Recurring household tasks | `20_context/chores/` | `nature`, `frequency`, `duration` |
| `context` | Personal background docs | `20_context/self/` | (freeform) |

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

- Use `[[wikilinks]]` for all internal cross-references: `[[jane-smith]]`, `[[2026-03-personal-website]]`
- Never use markdown links for internal notes
- The `project` field links to a project slug: `project: 2026-03-personal-website`
- The `entity` field is always an array: `entity: [jane-smith]`
- The `topics` field enables discovery: `topics: [typescript, frontend, review]`
- Notes in `10_notes/` link by full filename: `[[20260317-1000-setup-nextjs-project]]`
- Entities and projects link by slug: `[[jane-smith]]`, `[[2026-03-personal-website]]`

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

1. Always read `20_context/self/owner.md` and `20_context/self/schrijfstijl.md` before drafting any message
2. Always use frontmatter on every note — refer to `20_context/life-os-schema.md` for the full field spec
3. Use `[[wikilinks]]` for cross-references, never markdown links for internal notes
4. Write in the user's language (default: English) unless asked otherwise
5. When creating tasks, set `status: 🔴 to-do` and include a `## 🔴 to-do` section in the body
6. When completing tasks, update status to `🟢 done` and add a `## 🟢 done` section with what was done
7. Keep the `topics` field populated — it's how notes are discovered later
8. Never delete notes — update status to `🟢 done` or `⚫ cancelled`
9. When creating interactions, always include `entity` (required field)
10. After making changes, commit with a descriptive message

## Common Mistakes to Avoid

- Do NOT create new folders — all timestamped notes go in `10_notes/`
- Do NOT use markdown links (`[text](path)`) for internal notes — use `[[wikilinks]]`
- Do NOT put entity/project slugs in note filenames — that info lives in frontmatter
- Do NOT forget the `entity` field on interactions — it's required for contact tracking
- Do NOT store status on note types other than `task` and `project`

## How to Search the Vault

- Find notes by type: search for `type: task` in frontmatter
- Find notes by topic: search for keywords in `topics` arrays
- Find notes by entity: search for entity slugs in `entity` fields
- Find overdue tasks: look for `due:` dates before today with `status: 🔴 to-do`
- Find project tasks: search for `project: <slug>` across `10_notes/`
