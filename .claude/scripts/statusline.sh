#!/bin/bash

# PRD-Engine - Status Line Script
# מציג אחוז context בשורת הסטטוס של Claude Code CLI
# קורא JSON מ-stdin ומציג אחוז עם אייקון צבעוני

input=$(cat)

# בדוק אם jq קיים
if ! command -v jq &> /dev/null; then
    echo "[jq not installed]"
    exit 0
fi

# חלץ מידע
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"' 2>/dev/null || echo "Claude")
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' 2>/dev/null || echo "0")

# וודא שיש ערך
if [ -z "$PCT" ] || [ "$PCT" = "null" ]; then
    PCT="0"
fi

# עיגול למספר שלם
PCT_INT=$(printf "%.0f" "$PCT" 2>/dev/null || echo "0")

# אייקון לפי אחוז
if [ "$PCT_INT" -lt 30 ] 2>/dev/null; then
    ICON="🟢"
elif [ "$PCT_INT" -lt 50 ] 2>/dev/null; then
    ICON="🟡"
elif [ "$PCT_INT" -lt 70 ] 2>/dev/null; then
    ICON="🟠"
else
    ICON="🔴"
fi

# שמור אחוז לקובץ (לשימוש hooks אחרים)
mkdir -p .claude/memory
echo "$PCT_INT" > .claude/memory/context-status.txt

# הצג בשורת הסטטוס
echo "$ICON [$MODEL] Context: ${PCT}%"
