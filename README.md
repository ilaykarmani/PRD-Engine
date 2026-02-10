# PRD-Engine

**Turn product ideas into development-ready specs in minutes, not days.**

PRD-Engine is a Claude Code framework that generates complete technical specifications through structured AI conversations. Three specialized agents (PM, Architect, Frontend) ask the right questions and produce documentation that developers can code from directly.

![PRD-Engine Architecture](PRD-Engine-Architecture.svg)

---

## The Problem

Telling an AI "write me a PRD based on discovery X" sounds fast. In reality, it produces hallucinations, open-ended gaps, and missing edge cases — a recipe for spaghetti code.

Developers hit roadblocks mid-sprint. PMs answer the same questions repeatedly. Features ship incomplete.

## The Solution

PRD-Engine asks 28 structured questions across three perspectives, validates for contradictions, and outputs a single markdown file ready for any AI coding tool.

The difference between starting with a proper PRD vs. a random prompt is night and day.

```
Your idea → 28 questions → Cross-validation → Dev-ready spec
```

---

## Why PRD-Engine

### Deep Multi-Agent Orchestration

Three agents work in sequence, each reading its own SKILL.md configuration:

| Agent | Focus | Questions |
|-------|-------|-----------|
| **PM** | Business: users, stories, KPIs | 9 |
| **Architect** | Technical: data, APIs, validations | 8 |
| **Frontend** | UI/UX: layouts, states, accessibility | 11 |

Each agent stays in scope. No context bleeding. No repeated questions.

### Context Window Management

AI agents lose coherence when context fills up. PRD-Engine solves this:

- **Checkpoint system** saves progress after every meaningful answer
- **Sub-agents** handle heavy reads (documents, cross-epic checks) in isolated contexts
- **Compact protocol** warns at 50% context and offers clean handoff
- **Live context indicator** shows percentage after each output

Sub-agents return only what's needed — summaries, not raw dumps. The main agent stays sharp.

### Zero Open Ends

Every detail gets defined. Every edge case gets covered. The 7-point cross-review catches:

1. PM Coverage — All user stories mapped?
2. Tech Consistency — Entities match APIs?
3. Frontend Mapping — All endpoints in UI?
4. Analytics Events — 12+ events defined?
5. SEO Metadata — All public pages tagged?
6. i18n Consistency — No hardcoded strings?
7. Deferred Items — What's postponed and why?

### Session Synchronization

Start a new session? PRD-Engine knows exactly where you left off:

1. Reads `checkpoint.json` (current position)
2. Sub-agent scans all skill files + lessons + existing epics
3. Displays status: "Epic X, Agent Y, Question Z"
4. Continues seamlessly

No re-explaining. No lost context.

---

## Memory System

| File | Purpose |
|------|---------|
| `checkpoint.json` | Current position — epic, agent, question number |
| `prd-index.json` | Compact map of all entities, APIs, relations across epics |
| `lessons.md` | Personalization — learned patterns from corrections |
| `epics/*.md` | Complete Q&A specs per feature, ready for development |

### Lessons = Personalization

PRD-Engine learns from your corrections:

```markdown
## Lesson 1: Question Format
- Mistake: Asked without options
- Fix: Always use structured choices

## Lesson 2: User Preferences
- User prefers Hebrew for conversation, English for technical terms
```

Next session applies these automatically.

### PRD Index = Cross-Epic Intelligence

```json
{
  "epics": {
    "user-auth": {
      "entities": ["User", "Role"],
      "apis": ["/api/auth/login"]
    }
  },
  "global_entities": ["User", "Role", "Product"]
}
```

When specifying a new feature, the Architect asks: "I see we have a User entity. Should orders link to existing users?"

No duplicate entities. No orphaned relations.

---

## Output

Each epic produces one markdown file:

- **Part A** — User stories, acceptance criteria, roles, KPIs
- **Part B** — Data models, API specs, error codes, validations
- **Part C** — Wireframes, responsive rules, design system
- **Part D** — Analytics events, SEO, cross-review summary

Download any file from `epics/`. Open in Cursor, Copilot, Windsurf, or any AI coding tool. Start building immediately.

---

## Quick Start

```bash
git clone https://github.com/ilaykarmani/PRD-Engine.git
cd PRD-Engine
./setup.sh
```

Open in VSCode, run `claude`, and type: **"Let's spec a new feature"**

---

## File Structure

```
PRD-Engine/
├── README.md
├── setup.sh
├── PRD-Engine-Architecture.svg
├── PRD-Engine-Architecture.md
├── PRD-Engine-Architecture.pdf
│
└── .claude/
    ├── CLAUDE.md                    # 18 iron rules governing behavior
    ├── settings.json                # Hook configurations
    ├── settings.local.json          # WebFetch permissions
    │
    ├── scripts/
    │   └── statusline.sh            # Live context % indicator
    │
    ├── memory/
    │   ├── checkpoint.json          # Current position (epic, agent, question)
    │   ├── prd-index.json           # Cross-epic entity/API map
    │   ├── lessons.md               # Learned corrections and patterns
    │   ├── session-init.json        # Sub-agent verification
    │   └── epics/                   # Development-ready spec files
    │       ├── 01-user-auth.md
    │       ├── 02-product-catalog.md
    │       └── ...
    │
    └── skills/prd-engine/
        ├── SKILL.md                 # Main orchestrator
        ├── config/
        │   └── workflow.json        # Workflow settings
        ├── agents/
        │   ├── product-manager/
        │   │   └── SKILL.md         # 9 business questions
        │   ├── architect/
        │   │   └── SKILL.md         # 8 technical questions
        │   └── frontend/
        │       └── SKILL.md         # 11+1 UI/UX questions
        ├── rules/
        │   ├── 01-questions-format.md
        │   ├── 02-review-crosscheck.md
        │   └── 03-reflection.md
        ├── templates/
        │   ├── epic-template.md
        │   └── landing-page-guide.md
        └── hooks/
            ├── startup.sh           # Session start
            ├── pre-compact.sh       # Before context compact
            └── auto-checkpoint.sh   # Session end
```

---

## Requirements

- [Claude Code](https://claude.ai/code) (Pro/Max)
- Git

---

## License

MIT

---

Built by [Ilay Karmani](https://github.com/ilaykarmani) with [Claude Code](https://claude.ai/code)
