---
type: note
category: note
created: 2026-03-17
slug: schema
title: "Life OS Schema Reference"
topics: [schema, system, reference]
---

# Life OS Schema

Quick reference for all note types and their frontmatter fields.

## Shared Fields (all types)

| Field | Required | Description |
|-------|----------|-------------|
| `type` | yes | task, note, project, entity, resource |
| `created` | yes | YYYY-MM-DD |
| `slug` | yes | Unique kebab-case identifier |
| `title` | yes | Human-readable title |
| `topics` | yes | Array of keywords for discovery |
| `area` | recommended | work, home, self, social |

## Task

```yaml
type: task
created: 2026-03-17
slug: example-task
title: "Example Task"
topics: [example]
status: to-do          # to-do → in-progress → done (+ waiting)
priority: p2           # p1 | p2 | p3
area: work
project:               # project slug (optional)
entity: []             # linked entities (optional)
due:                   # YYYY-MM-DD (optional)
```

## Note

```yaml
type: note
created: 2026-03-17
slug: example-note
title: "Example Note"
topics: [example]
category: note         # note | meeting | journal | reflection
area: self
```

## Project

```yaml
type: project
created: 2026-03-17
slug: example-project
title: "Example Project"
topics: [example]
status: active         # active | paused | done | archived
area: work
start_date: 2026-03-17
```

## Entity

```yaml
type: entity
created: 2026-03-17
slug: first-last
title: "First Last"
topics: []
category: person       # person | company | place

# Person fields
first_name: "First"
last_name: "Last"
email: ""
phone: ""
company: ""
role: ""
```

## Resource

```yaml
type: resource
created: 2026-03-17
slug: example-resource
title: "Example Resource"
topics: [example]
category: bookmark     # bookmark | article | book | tool | video | course
area: self
url: "https://..."
```

## Linking Cheat Sheet

- **Task → Project:** `project: project-slug` in frontmatter
- **Task → Person:** `entity: [person-slug]` in frontmatter
- **Any → Any:** `[[slug]]` wikilink in the note body
- **Discovery:** `topics: [keyword1, keyword2]` — find related notes by shared topics
