#!/bin/bash

# PRD-Engine - Pre-Compact Hook
# טריגר: PreCompact (ידני /compact או אוטומטי)
# מטרה: רשת ביטחון — מכריח שמירה לפני דחיסת קונטקסט

MEMORY_DIR=".claude/memory"
CHECKPOINT_FILE="$MEMORY_DIR/checkpoint.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# עדכן timestamp ב-checkpoint
if [ -f "$CHECKPOINT_FILE" ] && command -v jq &> /dev/null; then
    TEMP_FILE=$(mktemp)
    jq --arg ts "$TIMESTAMP" \
       '.last_saved = $ts | .pre_compact = true | .session_ended = false' \
       "$CHECKPOINT_FILE" > "$TEMP_FILE"
    mv "$TEMP_FILE" "$CHECKPOINT_FILE"
fi

echo ""
echo "⚠️ ════════════════════════════════════════════════════════════"
echo "   🔄 COMPACT — פרוטוקול שמירה!"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "   🔴 חובה לפני ש-compact מסתיים:"
echo ""
echo "   1. 💾 וודא שכל התשובות שמורות בקובץ ה-epic:"
echo "      .claude/memory/epics/XX-[epic-name].md"
echo ""
echo "   2. 💾 וודא ש-checkpoint.json מעודכן:"
echo "      current_epic, current_agent, question_number"
echo ""
echo "   3. 📝 שמור סיכום של מה שנאסף בשיחה הנוכחית"
echo ""
echo "   4. 📊 עדכן prd-index.json אם הושלם epic"
echo ""
echo "════════════════════════════════════════════════════════════"

exit 0
