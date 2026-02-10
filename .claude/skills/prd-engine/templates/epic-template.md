<!--
📋 DEVELOPMENT-READY SPECIFICATION
=================================
קובץ זה הוא אפיון טכני מלא ומוכן לפיתוח.
ניתן להעתיק קובץ זה ולהזין אותו לכל כלי פיתוח AI:
  → Cursor / Claude Code / GitHub Copilot / Windsurf / Bolt
הקובץ כולל את כל המידע הנדרש: דרישות עסקיות, ארכיטקטורה, UI, ו-Cross-Review.

Status: ⏳ In Progress
Last Updated: [timestamp]
Epic: [XX] — [שם ה-epic]
Product: [שם המוצר]
-->

# Epic [XX]: [שם ה-Epic]

---

## Part A: Business Requirements (PM)

**משתמש עיקרי:** [סוג המשתמש]
**בעיה:** [מה הבעיה שה-epic פותר]
**פתרון:** [משפט אחד שמתאר את הפתרון]
**עדיפות:** [P1/P2/P3] — [נימוק]

### User Stories
```
US-1: בתור [סוג משתמש 1], אני רוצה [Y] כדי ש[Z]
US-2: בתור [סוג משתמש 2], אני רוצה [Y] כדי ש[Z]
US-3: בתור [אדמין], אני רוצה [Y] כדי ש[Z]
```

### Acceptance Criteria (8-12)

**Performance:**
- [ ] [קריטריון — LCP, זמן תגובה, וכו']
- [ ] [קריטריון]

**Security:**
- [ ] [קריטריון — CSRF, rate limiting, וכו']
- [ ] [קריטריון]

**UX:**
- [ ] [קריטריון — responsive, accessible, וכו']
- [ ] [קריטריון]

**Business:**
- [ ] [קריטריון — conversion, edge cases, וכו']
- [ ] [קריטריון]

### User Roles Table

| # | תפקיד | Login Method | ניתוב אחרי Login | Scope |
|---|--------|-------------|------------------|-------|
| 1 | [תפקיד] | [method] | [עמוד יעד] | [הרשאות] |
| 2 | [תפקיד] | [method] | [עמוד יעד] | [הרשאות] |

### Edge Cases / Funnel

| שלב | שם | טריגר | פעולה |
|------|------|--------|--------|
| 1 | [שלב] | [מה גורם] | [מה קורה] |
| 2 | [שלב] | [מה גורם] | [מה קורה] |

**Edge Cases:**
| # | מקרה | התנהגות צפויה | הודעה למשתמש |
|---|------|-------------|-------------|
| 1 | [מקרה קצה] | [מה קורה] | [הודעה] |
| 2 | [מקרה קצה] | [מה קורה] | [הודעה] |

### KPIs

**[תחום 1 — למשל Landing Page]:**
| KPI | מדד | יעד | כלי מדידה |
|-----|------|------|----------|
| [שם] | [מה מודדים] | [יעד מספרי] | [GA/Mixpanel/וכו'] |

**[תחום 2 — למשל Login/Signup]:**
| KPI | מדד | יעד | כלי מדידה |
|-----|------|------|----------|
| [שם] | [מה מודדים] | [יעד מספרי] | [GA/Mixpanel/וכו'] |

### 2030 Recommendations (PM)
1. [המלצה] — [הסבר עסקי + למה זה שווה]
2. [המלצה] — [הסבר]
3. [המלצה] — [הסבר]

### Key Decisions (PM)
- [החלטה + נימוק]
- [החלטה + נימוק]

---

## Part B: Technical Architecture (Architect)

### Entities

#### 1. [Entity Name]
- **מטרה:** [מה ה-entity מייצג במערכת]
- **שדות:**

| Field | Type | Nullable | Unique | Default | Business Rule |
|-------|------|----------|--------|---------|---------------|
| id | UUID | false | true | auto | Primary key |
| [field] | [type] | [bool] | [bool] | [default] | [rule] |

- **Indexes:** [רשימת indexes]
- **חוקים עסקיים:** [business rules]
- **Edge Cases:** [מקרי קצה ספציפיים ל-entity]

#### 2. [Entity Name]
- **מטרה:** [תיאור]
- **שדות:**

| Field | Type | Nullable | Unique | Default | Business Rule |
|-------|------|----------|--------|---------|---------------|
| id | UUID | false | true | auto | Primary key |
| [field] | [type] | [bool] | [bool] | [default] | [rule] |

- **Indexes:** [רשימת indexes]
- **חוקים עסקיים:** [business rules]
- **Edge Cases:** [מקרי קצה]

### Relations

| From | To | Type | FK Column | ON DELETE | ON UPDATE |
|------|-----|------|-----------|----------|----------|
| [entity] | [entity] | [1:1/1:N/N:N] | [column] | [CASCADE/RESTRICT/SET NULL] | [CASCADE] |

### API Endpoints

| # | Method | Endpoint | Auth | Rate Limit | תיאור | MVP? |
|---|--------|----------|------|------------|--------|------|
| 1 | [method] | [path] | [Public/Bearer/Admin] | [X/min] | [desc] | 🟢/🔵 |

**Auth Levels:**
- **Public** — ללא אותנטיקציה
- **Bearer** — JWT token נדרש
- **Admin** — JWT + role check

**לכל endpoint קריטי:**
```
[Method] [Path]
  Request Body: { [fields] }
  Response 200: { [fields] }
  Error Responses: [error codes]
```

### Validations

| שדה | כלל | הודעת שגיאה (HE) | הודעת שגיאה (EN) |
|------|------|-------------------|-------------------|
| [field] | [rule] | [message HE] | [message EN] |

**Frontend UX notes:** Real-time validation (debounce 300ms), inline errors, red border, submit disabled with errors, focus on first error.

### Error Codes

**Auth Errors:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Account Errors:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Not Found:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Validation:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Conflict:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Rate Limit:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Server:**
| Code | HTTP | מתי | הודעה |
|------|------|------|-------|
| [code] | [status] | [when] | [message] |

**Error Response Format:**
```json
{
  "error": {
    "code": "[ERROR_CODE]",
    "message": "[הודעת שגיאה]",
    "details": null,
    "field": null,
    "timestamp": "2026-01-01T00:00:00Z",
    "requestId": "req_abc123"
  }
}
```

### Logging & Monitoring

**INFO Events** (הצלחות):
- [event 1], [event 2], ...

**WARN Events** (חשדות):
- [event 1], [event 2], ...

**ERROR Events** (כשלונות):
- [event 1], [event 2], ...

**PII Rules:**
- **לעולם לא לרשום:** passwords, tokens, OTP codes, credit cards
- **Mask:** email (i***@example.com), phone (05X-XXX-XX12)

**Retention:**
| Level | Retention |
|-------|-----------|
| INFO | 30 days |
| WARN | 90 days |
| ERROR | 365 days |

**Alerts:**
| Condition | Channel | Priority |
|-----------|---------|----------|
| [condition] | [Slack/PagerDuty] | [High/Critical] |

### Dependencies

**Forward Dependencies** (ה-epic הזה תלוי ב-):
- [ ] [entity/epic שחייב להיות מוכן קודם]

**Side Effects** (ה-epic הזה משפיע על-):
- [ ] [epics קיימים שיושפעו]

**Pending Dependencies** (בהמתנה ל-):
- [ ] [epics שעוד לא אופיינו אבל קשורים]

### Deferred to Phase 2
- [מה נדחה ולמה]

### 2030 Recommendations (Architect)
1. [המלצה] — [הסבר טכני + למה זה שווה]
2. [המלצה] — [הסבר]
3. [המלצה] — [הסבר]

### Key Decisions (Architect)
- [החלטה + נימוק]
- [החלטה + נימוק]

---

## Part C: Frontend Specification (Frontend)

### Reference & Direction
**כיוון אסתטי:** [הכיוון שנבחר]
**Reference:** [תמונה/לינק/מדריך]

### ASCII Wireframes

```
┌─────────────────────────────────────────┐
│              [Page Name]                 │
├─────────────────────────────────────────┤
│                                         │
│  [Wireframe content — מבנה העמוד       │
│   בטקסט ASCII עם כל הסקשנים]          │
│                                         │
└─────────────────────────────────────────┘
```

### Layout
**מבנה:** [תיאור Layout — Split Screen / Single Column / וכו']
**Grid:** [מערכת Grid — 12 columns / CSS Grid / וכו']

### Loading & Empty States

| Component | Loading Display | Duration | Behavior |
|-----------|----------------|----------|----------|
| [component] | [Skeleton/Spinner/Shimmer] | [ms] | [behavior] |

**Empty State:** [תיאור — אייקון + טקסט + CTA]

### Error Display — 3 Levels

**Level 1 — Inline (שדה):**
```
שגיאות validation מתחת לשדה הספציפי
→ גבול אדום (#EF4444)
→ הודעה באדום מתחת לשדה
→ אייקון ⚠️
→ דוגמה: "כתובת אימייל אינה תקינה"
```

**Level 2 — Banner (טופס):**
```
שגיאה ברמת הטופס מעל הטופס
→ רקע אדום בהיר + גבול אדום
→ Shake animation (0.5s)
→ דוגמה: "אימייל או סיסמה שגויים"
```

**Level 3 — Toast (רשת/שרת):**
```
שגיאת רשת/שרת בפינת המסך
→ Toast בפינה עליונה (או תחתונה)
→ נעלם אוטומטית אחרי 5 שניות
→ כפתור X לסגירה
→ דוגמה: "שגיאת חיבור — נסו שוב"
```

### Success States

| פעולה | תצוגה | הודעה | משך | ניתוב |
|--------|--------|--------|------|-------|
| [action] | [Toast/Redirect/Inline] | [message] | [ms] | [to where] |

### Responsive Breakpoints

| Breakpoint | Width | שינויים |
|-----------|-------|---------|
| Mobile | < 768px | [שינויים ספציפיים] |
| Tablet | 768-1024px | [שינויים ספציפיים] |
| Desktop | > 1024px | [layout ברירת מחדל] |

### Accessibility (WCAG AA)

| קטגוריה | דרישה | יישום |
|----------|--------|--------|
| Keyboard | [tab order, shortcuts] | [פירוט] |
| Screen Reader | [aria-labels, roles] | [פירוט] |
| Contrast | [minimum ratios] | [פירוט] |
| Focus | [visible indicators] | [פירוט] |
| RTL | [logical properties] | [פירוט] |
| Forms | [labels, errors, hints] | [פירוט] |

### Animations

| Element | Animation | Duration | Easing | CSS |
|---------|-----------|----------|--------|-----|
| [element] | [type] | [ms] | [easing] | [property] |

### Validation (Frontend)

| שדה | Timing | כלל | הודעת שגיאה |
|------|--------|------|------------|
| [field] | [onBlur/onChange/onSubmit] | [rule] | [message] |

### i18n System

| פרמטר | ערך |
|--------|------|
| ספרייה | [next-intl / react-intl] |
| מבנה קבצי תרגום | [/locales/he.json, /locales/en.json] |
| URL Pattern | [locale prefix: /he/... /en/...] |
| CSS Logical Properties | [margin-inline-start, padding-inline] |
| זיהוי שפה | [browser / cookie / URL] |
| Default Locale | [he] |
| Supported Locales | [he, en] |

### Design System

| פרמטר | ערך |
|--------|------|
| **Theme** | [Light / Dark / Both] |
| **Primary Color** | [hex] |
| **Primary Light** | [hex] |
| **Primary Dark** | [hex] |
| **Secondary Color** | [hex] |
| **Success** | [hex] |
| **Error** | [hex] |
| **Warning** | [hex] |
| **Neutral 50-900** | [hex range] |
| **Font Family (HE)** | [font name] |
| **Font Family (EN)** | [font name] |
| **Font Sizes** | [xs/sm/base/lg/xl/2xl/3xl] |
| **Font Weights** | [Regular 400 / Medium 500 / SemiBold 600 / Bold 700] |
| **Border Radius** | sm: [X]px / md: [X]px / lg: [X]px / full |
| **Shadows** | sm: [value] / md: [value] / lg: [value] |
| **Spacing Base** | [X]px (מכפלות: 4, 8, 12, 16, 24, 32, 48, 64) |
| **White Space** | [Generous / Compact / Balanced] |

### 2030 Recommendations (Frontend)
1. [המלצה] — [הסבר + למה זה שווה]
2. [המלצה] — [הסבר]
3. [המלצה] — [הסבר]

### Key Decisions (Frontend)
- [החלטה + נימוק]
- [החלטה + נימוק]

---

## Part D: Cross-Review

### PM Review
- [ ] כל ה-User Stories מכוסים ע"י API ו-UI
- [ ] כל ה-KPIs ניתנים למדידה טכנית
- [ ] כל User Role מקבל את מה שצריך
- [ממצאים אם יש]

### Architect Review
- [ ] הארכיטקטורה עקבית עם ה-UI
- [ ] Validations תואמים בין Backend ל-Frontend
- [ ] Error Codes מכסים את כל מצבי ה-UI
- [ ] Auth Levels תואמים ל-User Roles
- [ממצאים אם יש]

### Frontend Review
- [ ] כל ה-UI מכוסה ע"י ה-API
- [ ] Error 3 Levels מכסים את כל Error Codes
- [ ] Success States מוגדרים לכל פעולה
- [ממצאים אם יש]

### Analytics Events

| # | Event Name | Trigger | Properties |
|---|-----------|---------|------------|
| 1 | [event] | [trigger] | [props] |
| 2 | [event] | [trigger] | [props] |
| ... | ... | ... | ... |
| 12+ | [event] | [trigger] | [props] |

### SEO Metadata

**[שם עמוד 1]:**
| Meta Tag | ערך |
|----------|------|
| title | [עד 60 תווים] |
| description | [עד 160 תווים] |
| og:title | [כותרת] |
| og:description | [תיאור] |
| og:image | [URL] |
| og:type | website |
| canonical | [URL] |

### i18n Consistency Check
- [ ] אין hardcoded strings
- [ ] כל הודעות שגיאה עם מפתח תרגום
- [ ] RTL/LTR מוגדר — CSS logical properties
- [ ] תאריכים ומספרים — Intl APIs

### Deferred Items (Phase 2)

| # | פריט שנדחה | סיבה | אומדן מאמץ | תלויות | Agent מקור |
|---|-----------|------|-----------|--------|-----------|
| 1 | [שם] | [סיבה] | [S/M/L] | [תלויות] | [PM/Arch/FE] |

### Review Summary
```
✅ פערים שנמצאו: [X]
✅ פערים שנסגרו: [Y]
⏸️ נדחה ל-Phase 2: [Z]
📊 סטטוס: [Epic מוכן לפיתוח ✅ / נדרש תיקון ⚠️]
```

---

## Key Decisions (All Agents)

| # | החלטה | נימוק | Agent |
|---|--------|--------|-------|
| 1 | [החלטה] | [למה] | [PM/Arch/FE] |
| 2 | [החלטה] | [למה] | [PM/Arch/FE] |
