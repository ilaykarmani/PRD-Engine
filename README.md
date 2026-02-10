# PRD-Engine

> מערכת Multi-Agent ליצירת אפיונים טכניים (PRD) לכל מוצר.
> 3 סוכנים (PM, Architect, Frontend) שואלים שאלות מובנות ומייצרים מסמך אפיון מוכן לפיתוח.

## Quick Start

```bash
# 1. שכפל את הריפו
git clone https://github.com/user/PRD-Engine.git
cd PRD-Engine

# 2. הרץ את אשף ההתקנה
chmod +x setup.sh
./setup.sh

# 3. פתח ב-VSCode + Claude Code
code .
# בטרמינל: claude

# 4. ההודעה הראשונה
# Claude יזהה את ה-skill אוטומטית ויתחיל בפרוטוקול אתחול
# פשוט כתוב: "בוא נתחיל לאפיין את המוצר"
```

## מה זה עושה?

PRD-Engine הוא framework ל-Claude Code שמפעיל 3 "כובעים" (agents):

1. **Product Manager** — שאלות עסקיות: User Stories, עדיפויות, KPIs
2. **Architect** — שאלות טכניות: Data Model, API, Validations + Sweet Spot (MVP vs עתיד)
3. **Frontend** — שאלות UI/UX: Layout, States, Responsive, Accessibility

כל epic עובר את 3 הסוכנים + Cross-Review, ונשמר כקובץ MD מוכן לפיתוח.

## מבנה הפלט

```
.claude/memory/epics/
├── 01-[epic-name].md    ← קובץ אפיון מלא (Part A + B + C + D)
├── 02-[epic-name].md    ← כל epic = מסמך עצמאי
└── ...                  ← ניתן להעביר לכל כלי פיתוח AI
```

כל קובץ epic מכיל:
- **Part A** (PM): דרישות עסקיות, User Story, Acceptance Criteria
- **Part B** (Architect): Data Model, API, Validations, Dependencies
- **Part C** (Frontend): Layout, States, Responsive, Accessibility
- **Part D** (Cross-Review): 3 הסוכנים מוודאים עקביות

## מקורות מסמך נתמכים

- Google Docs
- Notion
- Confluence
- טקסט חופשי

## דרישות

- [Claude Code](https://claude.ai/code) (Pro / Max)
- VSCode (מומלץ)
- Git

## רישיון

MIT
