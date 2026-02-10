# כלל 02: Review צולב (Cross-Review)

## כלל ברזל
**לפני כתיבה לקובץ epic — חובה Review צולב מורחב (7 בדיקות). רק אחרי שכולן עוברות (✅) ממשיכים לכתיבה.**

## מתי מפעילים
אחרי שכל 3 ה-Agents סיימו את השאלות שלהם, **לפני** כתיבה לקובץ.

```
PM ✅ → Architect ✅ → Frontend ✅
                                    ↓
                         [Review צולב — כאן!]
                         [7 בדיקות חובה]
                                    ↓
                             Diff → כתיבה
```

---

## 7 בדיקות חובה

### בדיקה 1: PM בודק — כיסוי User Stories
1. האם ה-API Endpoints שהגדיר Architect מכסים את **כל** ה-User Stories?
2. האם ה-UI שהגדיר Frontend מאפשר את **כל** התרחישים העסקיים?
3. האם יש Edge Cases עסקיים שלא טופלו?
4. האם ה-KPIs מכוסים — כל מדד הצלחה שהוגדר ניתן למדידה טכנית?
5. האם כל תפקיד ב-User Roles Table מקבל את ה-UI וה-API שהוא צריך?

```
👩‍💼 PM Review:
   ✅ כל ה-User Stories מכוסים ע"י API ו-UI
   [או]
   ⚠️ חסר: [תיאור]
      💡 הצעה: [פתרון]
```

### בדיקה 2: Architect בודק — עקביות טכנית
1. האם ה-UI דורש data שלא קיים ב-Entities/API?
2. האם יש Validation בצד ה-UI שלא תואם ל-Backend?
3. האם ה-Error Messages מכסים את **כל** שגיאות ה-API (כל Error Code)?
4. האם כל Entity שדורש ה-Frontend מוגדר ב-Data Model?
5. האם Auth Levels ב-API תואמים ל-User Roles שהגדיר PM?

```
🏗️ Architect Review:
   ✅ הארכיטקטורה עקבית עם ה-UI
   [או]
   ⚠️ חסר: [תיאור]
      💡 הצעה: [פתרון]
```

### בדיקה 3: Frontend בודק — כיסוי UI ↔ API
1. האם כל שדה ב-UI מקבל data מ-API endpoint מוגדר?
2. האם Loading/Empty/Error states תואמים את ה-API responses?
3. האם יש אינטראקציה שדורשת endpoint שלא הוגדר?
4. האם Error 3 Levels (Inline/Banner/Toast) מכסים את כל Error Codes?
5. האם Success States מוגדרים לכל פעולת POST/PUT/PATCH?

```
🎨 Frontend Review:
   ✅ כל ה-UI מכוסה ע"י ה-API
   [או]
   ⚠️ חסר: [תיאור]
      💡 הצעה: [פתרון]
```

### בדיקה 4: Analytics Events (חדש)
בדוק שכל פעולה משמעותית מכוסה ב-tracking.
Claude מייצר טבלת events:

```markdown
| # | Event Name | Trigger | Properties |
|---|-----------|---------|------------|
| 1 | page_view | כניסה לעמוד | page_name, referrer, utm_source |
| 2 | form_start | מתחיל למלא טופס | form_name, source |
| 3 | form_submit | שליחת טופס | form_name, duration_ms, success |
| 4 | form_error | שגיאה בטופס | form_name, error_code, field |
| 5 | cta_click | לחיצה על CTA | button_name, position, variant |
| 6 | login_success | התחברות מוצלחת | method, duration_ms |
| 7 | login_failure | כשלון התחברות | method, error_code |
| 8 | signup_complete | סיום הרשמה | method, referral_source |
| 9 | feature_used | שימוש בפיצ'ר | feature_name, context |
| 10 | error_displayed | הצגת שגיאה | error_code, error_level, page |
| 11 | session_start | תחילת session | landing_page, device_type |
| 12 | scroll_depth | גלילה בעמוד | page_name, depth_percent |
```

**מינימום 12 events לכל epic.** Claude מתאים את ה-events ל-epic הספציפי.

```
📊 Analytics Events:
   ✅ X events מוגדרים (מינימום 12)
   [או]
   ⚠️ חסרים events ל: [פעולות]
      💡 הצעה: [events חסרים]
```

### בדיקה 5: SEO Metadata (חדש)
לכל עמוד public-facing, Claude מייצר:

```markdown
**[שם עמוד]:**
| Meta Tag | ערך |
|----------|------|
| title | [עד 60 תווים] |
| description | [עד 160 תווים] |
| og:title | [כותרת לשיתוף] |
| og:description | [תיאור לשיתוף] |
| og:image | [URL לתמונה] |
| og:type | website |
| og:url | [canonical URL] |
| twitter:card | summary_large_image |
| canonical | [canonical URL] |
```

**לכל עמוד שנגיש לציבור:**
- `<title>` — עד 60 תווים, כולל שם המוצר
- `<meta description>` — עד 160 תווים
- OG tags (title, description, image, type, url)
- Twitter card
- Canonical URL
- Schema.org (אם רלוונטי — למשל FAQPage, Product)

```
🔍 SEO Metadata:
   ✅ כל [X] עמודים public מכוסים
   [או]
   ⚠️ חסר SEO ל: [עמודים]
      💡 הצעה: [מה להוסיף]
```

### בדיקה 6: i18n Consistency (חדש)
וידוא שכל הטקסטים מוכנים ל-internationalization:

1. **אין hardcoded strings** — כל טקסט הוא i18n key
2. **כל הודעות שגיאה** — עם מפתח תרגום (HE + EN מוגדרים)
3. **RTL/LTR** — CSS logical properties מוגדרים (margin-inline, padding-inline)
4. **Direction** — כל component שמכיל טקסט מוגדר ל-dir="auto" או dir="rtl"
5. **תאריכים ומספרים** — Intl.DateTimeFormat / Intl.NumberFormat

```
🌐 i18n Check:
   ✅ אין hardcoded strings, RTL מוגדר
   [או]
   ⚠️ hardcoded strings נמצאו ב: [רכיבים]
      💡 הצעה: [keys לתרגום]
```

### בדיקה 7: Deferred Documentation (חדש)
כל מה שנדחה ל-Phase 2 חייב להיות מתועד במפורש:

```markdown
| # | פריט שנדחה | סיבה | אומדן מאמץ | תלויות | Agent מקור |
|---|-----------|------|-----------|--------|-----------|
| 1 | [שם] | [למה נדחה] | [S/M/L] | [תלוי ב-X] | PM/Arch/FE |
| 2 | [שם] | [למה נדחה] | [S/M/L] | [תלוי ב-X] | PM/Arch/FE |
```

**כלל:** אין פריט שנאמר "נדחה" בלי שורה בטבלה הזו.

```
⏸️ Deferred Items:
   ✅ כל [X] פריטים שנדחו מתועדים עם סיבה + אומדן
   [או]
   ⚠️ חסר תיעוד ל: [פריטים]
      💡 הצעה: [מה לתעד]
```

---

## Structured Summary — סיכום בסוף Review

בסוף ה-Cross-Review, Claude מציג סיכום מובנה:

```
🔍 Cross-Review Summary — [שם ה-Epic]
═══════════════════════════════════════════════

👩‍💼 PM Review:          ✅ / ⚠️ [X ממצאים]
🏗️ Architect Review:   ✅ / ⚠️ [X ממצאים]
🎨 Frontend Review:    ✅ / ⚠️ [X ממצאים]
📊 Analytics Events:   ✅ [X events] / ⚠️ חסרים [Y]
🔍 SEO Metadata:       ✅ [X עמודים] / ⚠️ חסרים [Y]
🌐 i18n Check:         ✅ / ⚠️ [X strings חשופים]
⏸️ Deferred Items:     ✅ [X פריטים מתועדים] / ⚠️ [Y לא מתועדים]

═══════════════════════════════════════════════
✅ פערים שנמצאו: [X]
✅ פערים שנסגרו: [Y]
⏸️ נדחה ל-Phase 2: [Z]
📊 סטטוס: [Epic מוכן לפיתוח ✅ / נדרש תיקון ⚠️]
═══════════════════════════════════════════════
```

---

## זרימה כשיש סתירות

```
Review מוצא ⚠️
        ↓
הצגת הממצאים למשתמש (מקובצים לפי בדיקה)
        ↓
AskUserQuestionTool עם הפתרונות המוצעים
        ↓
עדכון התשובות
        ↓
Review חוזר (רק על מה שהשתנה)
        ↓
כל 7 הבדיקות ✅ → ממשיכים ל-Diff וכתיבה
```

## Anti-Patterns

| ❌ לא לעשות | ✅ במקום זה |
|------------|-----------|
| לדלג על Review כי "נראה בסדר" | תמיד להריץ כל 7 בדיקות — גם אם נראה ברור |
| לשאול 10 שאלות בבת אחת | לקבץ לפי נושא, שאלה אחת בכל פעם |
| לתקן בלי לשאול | להציג ממצא + אופציות |
| Review מלא אחרי תיקון קטן | review חוזר רק על מה שהשתנה |
| לדלג על Analytics/SEO כי "לא עסקי" | כל epic צריך tracking ו-SEO |
| לא לתעד פריטים שנדחו | כל דחייה → שורה בטבלת Deferred Items |
