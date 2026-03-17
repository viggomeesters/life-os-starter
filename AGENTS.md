# Life OS — Agent Instructions

You are working inside an Obsidian vault that serves as a personal knowledge base and task manager.

## Vault Structure

| Folder | What goes here |
|--------|---------------|
| `inbox/` | Quick captures, unsorted notes |
| `notes/` | All timestamped notes (tasks, entries, resources) |
| `projects/` | Project definitions |
| `entities/` | People, companies, places |
| `resources/` | Bookmarks, articles, references |
| `templates/` | Note templates (do not modify) |
| `attachments/` | Images, files |

## Note Types

This vault uses 5 note types. Every note has YAML frontmatter with at minimum: `type`, `created`, `slug`, `title`, `topics`.

### Task
A thing to do. Lives in `notes/`.

```yaml
type: task
status: to-do          # to-do | in-progress | waiting | done
priority: p2           # p1 (urgent) | p2 (normal) | p3 (low)
area: work             # work | home | self | social
project: project-slug  # optional, links to a project
entity: []             # optional, linked people/companies
due: YYYY-MM-DD        # optional deadline
```

### Note
A thought, meeting note, journal entry, or any freeform text. Lives in `notes/`.

```yaml
type: note
category: note         # note | meeting | journal | reflection
area: self             # work | home | self | social
```

### Project
A container that groups related tasks. Lives in `projects/`.

```yaml
type: project
status: active         # active | paused | done | archived
area: work             # work | home | self | social
start_date: YYYY-MM-DD
```

### Entity
A person, company, or place. Lives in `entities/`.

```yaml
type: entity
category: person       # person | company | place
```

Person-specific fields: `first_name`, `last_name`, `email`, `phone`, `company`, `role`.

### Resource
A bookmark, article, book, or tool. Lives in `resources/`.

```yaml
type: resource
category: bookmark     # bookmark | article | book | tool | video | course
url: "https://..."
```

## Linking

- Use `[[wikilinks]]` to connect notes: `[[quinten-de-vries]]`, `[[2026-03-personal-website]]`
- The `project` field in tasks links to a project slug
- The `entity` field is always an array: `entity: [quinten-de-vries]`
- The `topics` field is an array of keywords for discovery: `topics: [typescript, frontend]`

## Filename Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Task/Note/Resource | `YYYYMMDD-HHmm-slug.md` | `20260317-1400-fix-login-bug.md` |
| Project | `YYYY-MM-slug.md` | `2026-03-personal-website.md` |
| Entity | `slug.md` | `quinten-de-vries.md` |

## Rules

1. Always use frontmatter on every note you create
2. Use `[[wikilinks]]` for cross-references, never markdown links for internal notes
3. Write in the user's language (default: Dutch) unless asked otherwise
4. When creating tasks, always set `status: to-do` and include a `## to-do` section in the body
5. When completing tasks, update status to `done` and add a `## done` section with what was done
6. Keep the `topics` field populated — it's how notes are discovered later
7. Never delete notes, only update status to `done` or `archived`
