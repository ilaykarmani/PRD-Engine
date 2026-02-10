#!/bin/bash

# PRD-Engine - Setup Wizard
# אשף התקנה אינטראקטיבי שמגדיר את הפרויקט

echo ""
echo "🚀 ════════════════════════════════════════════════"
echo "   PRD-Engine - Setup Wizard"
echo "════════════════════════════════════════════════"
echo ""

# ─── 1. שם המוצר ───
read -p "📦 מה שם המוצר שלך? " PRODUCT_NAME
if [ -z "$PRODUCT_NAME" ]; then
    echo "❌ שם מוצר הוא שדה חובה"
    exit 1
fi

# ─── 2. שפת עבודה ───
echo ""
echo "🌐 באיזו שפה לנהל את האפיון?"
echo "   1. עברית (ברירת מחדל)"
echo "   2. English"
read -p "בחר [1/2]: " LANG_CHOICE
case $LANG_CHOICE in
    2) LANGUAGE="en" ;;
    *) LANGUAGE="he" ;;
esac

# ─── 3. מקור מסמך ───
echo ""
echo "📄 מאיפה מגיע מסמך הדרישות?"
echo "   1. Google Docs"
echo "   2. Notion"
echo "   3. Confluence"
echo "   4. אין — אכתוב טקסט חופשי"
read -p "בחר [1/2/3/4]: " DOC_CHOICE

case $DOC_CHOICE in
    1) DOC_SOURCE="google_docs"; DOMAIN="docs.google.com" ;;
    2) DOC_SOURCE="notion"; DOMAIN="notion.so" ;;
    3) DOC_SOURCE="confluence"; DOMAIN="confluence.atlassian.com" ;;
    *) DOC_SOURCE="manual"; DOMAIN="" ;;
esac

if [ "$DOC_SOURCE" != "manual" ]; then
    read -p "🔗 הדבק לינק למסמך: " DOC_URL
else
    DOC_URL=""
fi

# ─── 4. יצירת settings.local.json ───
if [ -n "$DOMAIN" ]; then
    cat > .claude/settings.local.json << EOF
{
  "permissions": {
    "allow": [
      "WebFetch(domain:$DOMAIN)"
    ]
  }
}
EOF
    echo "✅ settings.local.json נוצר עם הרשאה ל-$DOMAIN"
else
    cat > .claude/settings.local.json << EOF
{
  "permissions": {
    "allow": []
  }
}
EOF
    echo "✅ settings.local.json נוצר (ללא הרשאות חיצוניות)"
fi

# ─── 5. יצירת checkpoint.json ───
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > .claude/memory/checkpoint.json << EOF
{
  "product": "$PRODUCT_NAME",
  "language": "$LANGUAGE",
  "doc_source": "$DOC_SOURCE",
  "doc_url": "$DOC_URL",
  "last_saved": "$TIMESTAMP",
  "session_ended": false,
  "current_epic": null,
  "current_agent": null,
  "question_number": 0,
  "completed_epics": [],
  "pending": null,
  "notes": "Initial setup"
}
EOF
echo "✅ checkpoint.json נוצר"

# ─── 6. יצירת prd-index.json ───
cat > .claude/memory/prd-index.json << EOF
{
  "product": "$PRODUCT_NAME",
  "language": "$LANGUAGE",
  "created": "$TIMESTAMP",
  "epics": [],
  "global_entities": [],
  "features_completed": 0,
  "export_instruction": "כל epic עם dev_ready:true מוכן לפיתוח. העתק את הקובץ לכלי הפיתוח שלך."
}
EOF
echo "✅ prd-index.json נוצר"

# ─── 7. עדכון CLAUDE.md ───
sed -i "s/\[PRODUCT_NAME\]/$PRODUCT_NAME/g" .claude/CLAUDE.md 2>/dev/null
sed -i "s/\[LANGUAGE\]/$LANGUAGE/g" .claude/CLAUDE.md 2>/dev/null
sed -i "s|\[DOC_URL\]|$DOC_URL|g" .claude/CLAUDE.md 2>/dev/null
echo "✅ CLAUDE.md עודכן"

echo ""
echo "════════════════════════════════════════════════"
echo "   ✅ ההתקנה הושלמה!"
echo "════════════════════════════════════════════════"
echo ""
echo "   📦 מוצר: $PRODUCT_NAME"
echo "   🌐 שפה: $LANGUAGE"
echo "   📄 מקור: $DOC_SOURCE"
if [ -n "$DOC_URL" ]; then
    echo "   🔗 לינק: $DOC_URL"
fi
echo ""
echo "   🚀 הצעד הבא:"
echo "   פתח VSCode והפעל Claude Code"
echo "   כתוב: \"בוא נתחיל לאפיין את $PRODUCT_NAME\""
echo ""
echo "════════════════════════════════════════════════"
