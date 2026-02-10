#!/bin/bash

# PRD-Engine - Auto Checkpoint Hook
# טריגר: Stop — בסיום כל Session
# מטרה: שמירת checkpoint + reflection

MEMORY_DIR=".claude/memory"
CHECKPOINT_FILE="$MEMORY_DIR/checkpoint.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p "$MEMORY_DIR"

if [ -f "$CHECKPOINT_FILE" ]; then
    if command -v jq &> /dev/null; then
        TEMP_FILE=$(mktemp)
        jq --arg ts "$TIMESTAMP" '.last_saved = $ts | .session_ended = true' \
           "$CHECKPOINT_FILE" > "$TEMP_FILE"
        mv "$TEMP_FILE" "$CHECKPOINT_FILE"
    fi

    echo ""
    echo "💾 ════════════════════════════════════════════════════════"
    echo "   Checkpoint עודכן!"
    echo "════════════════════════════════════════════════════════"
    echo ""
    echo "📍 קובץ: $CHECKPOINT_FILE"
    echo "⏰ זמן: $TIMESTAMP"
    echo ""
    echo "🔍 Reflection — סוף Session"
    echo "════════════════════════════════════════════════════════"
    echo ""
    echo "   לפני סיום, בדוק:"
    echo "   ❓ שאלות שהמשתמש לא הבין?"
    echo "   🔄 סתירות בתשובות?"
    echo "   ➕ שאלות שהיה צריך לשאול?"
    echo "   🔁 דפוסים חוזרים?"
    echo ""
    echo "   💡 אם גילית דפוסים → עדכן lessons.md!"
    echo ""
    echo "════════════════════════════════════════════════════════"
else
    cat > "$CHECKPOINT_FILE" << EOF
{
  "product": null,
  "language": null,
  "last_saved": "$TIMESTAMP",
  "session_ended": true,
  "current_epic": null,
  "current_agent": null,
  "question_number": 0,
  "completed_epics": [],
  "pending": null,
  "doc_url": null,
  "notes": "Auto-generated on session end — run setup.sh first"
}
EOF
    echo ""
    echo "💾 Checkpoint נוצר (ריק — הרץ setup.sh)"
    echo ""
fi

exit 0
