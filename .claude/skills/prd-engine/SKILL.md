---
name: prd-engine
description: >
  מערכת Multi-Agent ליצירת אפיונים טכניים. 3 סוכנים (PM, Architect, Frontend)
  שואלים שאלות מובנות ומייצרים מסמך אפיון מלא ומוכן לפיתוח. הפעל כשמשתמש
  מבקש לאפיין מוצר, פיצ'ר, או epic.
---

# PRD-Engine — Main Orchestrator

## טריגרים
הפעל את ה-skill כשהמשתמש אומר:
- "בוא נאפיין..."
- "אפיון טכני ל..."
- "PRD ל..."
- "נתחיל epic חדש"
- כל בקשה שקשורה לאפיון מוצר

## פרוטוקול אתחול (SessionStart)
1. **קרא checkpoint.json** (ישירות — קובץ קטן, ~200 tokens)
2. **שלח סאב-אייג'נט** (subagent_type: "Explore", model: "sonnet"):
   - **הודע למשתמש:** 🔄 "שולח סאב-אייג'נט לסרוק את כל קבצי המערכת..."
   - קרא: SKILL.md + כל rules/ + lessons.md + prd-index.json + כל קבצי epics/
   - אם יש doc_url ב-checkpoint → קרא את המסמך (WebFetch) לתפוס שינויים
   - החזר סיכום 60 שורות + כתוב session-init.json
   - **כשחוזר:** ✅ "סאב-אייג'נט חזר: נמצאו X epics, Y שיעורים, Z entities"
3. **הצג סטטוס למשתמש** + הצע: [המשך מאיפה שעצרנו] / [התחל epic חדש]
4. **שמירה בנקודות מפתח** — רק בסיום Agent/Epic/compact/Session (לא אחרי כל תשובה!)

## Workflow — סדר עבודה לכל Epic

```
0. 📄 קבלת קישור למסמך מקור (AskUserQuestionTool)
   └─ יש קישור? / אין? / אפיון מאפס?
   └─ DOC_SOURCE = READ-ONLY! קריאה רק דרך סאב-אייגנט!

1. הגדרת Epic
   └─ מה שם ה-epic? מה הסקופ?

2. 🎩 PM (Product Manager) — Part A
   └─ 9 שאלות עסקיות
   └─ פלט: User Stories (2-4), Acceptance Criteria (8-12),
          User Roles Table, Edge Cases/Funnel, KPIs Tables,
          2030 Recommendations (PM), Key Decisions

3. 🎩 Architect — Part B
   └─ 8 שאלות טכניות
   └─ פלט: Entities (מפורטים — שדות, indexes, rules, edge cases),
          Relations (עם FK behavior), API Endpoints (עם Auth + Rate Limit),
          Validations (HE + EN), Error Codes (מקוטלגים — 7 קטגוריות),
          Logging & Monitoring, Dependencies (3 קטגוריות),
          2030 Recommendations (Architect), Key Decisions
   └─ Sweet Spot: 🟢 MVP חובה + 🔵 המלצות עתיד + ❓ המשתמש מחליט

4. 🎩 Frontend — Part C
   └─ שאלת הכנה: יש תמונת reference?
   └─ 11 שאלות UI/UX
   └─ פלט: ASCII Wireframes, Layout, Loading/Empty States,
          Error Display 3 Levels (Inline/Banner/Toast),
          Success States, Responsive Breakpoints,
          Accessibility (WCAG AA), Animations per-component,
          Validation (per-field), i18n System,
          Design System (colors, typography, spacing),
          2030 Recommendations (Frontend), Key Decisions

5. 🔍 Cross-Review — Part D
   └─ 7 בדיקות חובה:
      1. PM → כיסוי User Stories
      2. Architect → עקביות טכנית
      3. Frontend → כיסוי UI ↔ API
      4. Analytics Events (מינימום 12)
      5. SEO Metadata (לכל עמוד public)
      6. i18n Consistency
      7. Deferred Documentation
   └─ Structured Summary: פערים / נסגרו / נדחו / סטטוס
   └─ אם יש סתירות → AskUserQuestionTool → תיקון → review חוזר

6. כתיבה לקובץ Epic
   └─ הצג diff למשתמש → אישור → כתיבה ל-epics/XX-name.md
   └─ עדכן checkpoint.json + prd-index.json
   └─ הצג: "✅ Epic מוכן לפיתוח!"
```

## דגשים חשובים — רמת פירוט

> **כל Part חייב להיות ברמת הפירוט של epic מוכן לפיתוח — לא skeleton.**
> כל טבלה חייבת להיות מלאה עם ערכים אמיתיים, לא placeholders.
> כל Entity חייב שדות מפורטים, כל endpoint חייב request/response,
> כל הודעת שגיאה חייבת להיות בעברית ובאנגלית.

## כללי ברזל (סיכום — הפירוט המלא ב-CLAUDE.md)

0. **סאב-אייגנטים** — Sonnet בלבד + DOC_SOURCE תמיד דרך סאב-אייגנט
1. **שאלות מובנות** — AskUserQuestionTool + 🎯 השלכות + YAML format
2. **מודולריות** — 500 שורות מקסימום + הפרדת agents
3. **שמירה בנקודות מפתח** — checkpoint רק בסיום Agent/Epic/compact (לא כל תשובה!)
4. **אפס קצוות פתוחים** — כל פרט מוגדר + דוגמאות ❌/✅
5. **Plan Mode** — חובה לפני משימה משמעותית
6. **Cross-Review חובה** — 7 בדיקות לפני כתיבה לקובץ
7. **Sweet Spot** — 🟢 MVP / 🔵 עתיד / ❓ משתמש מחליט
8. **Epics = פלט מוכן לפיתוח** — להעביר לכל כלי AI
9. **Diff לפני כתיבה**
10. **גמישות הוליסטית** — שאלות SKILL = נקודת פתיחה, Agent מעמיק
11. **לולאת שיפור** — lessons.md עם תבנית מפורטת
12. **קריאת DOC_SOURCE** — בכל Session דרך סאב-אייגנט
13. **טעינת PRD Context** — prd-index.json לשאלות חכמות
14. **החלפת כובעים** — 🎩 עוברים ל-[Agent Name]
15. **Analytics Tracking** — 12+ events לכל epic
16. **Design System** — colors + typography + spacing חובה
17. **Reflection** — בסוף כל session

## החלפת כובעים (Hat Switching)
כש-Claude עובר בין agents, הוא:
1. קורא את ה-SKILL.md של ה-agent הבא
2. מודיע למשתמש: "🎩 עוברים ל-[Agent Name]"
3. שואל את השאלות של אותו agent בלבד
4. לא חוזר על שאלות שכבר נשאלו

## ניווט
בכל שלב המשתמש יכול:
- **[המשך]** — לשאלה הבאה
- **[חזור]** — לתקן תשובה קודמת
- **[סיכום]** — סיכום ביניים של מה שנאסף עד כה
- **[דלג]** — דלג לagent הבא (לא מומלץ)
