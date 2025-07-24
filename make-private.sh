#!/bin/bash

# ============================================
# سكريبت لتحويل جميع المستودعات العامة إلى خاصة
# ============================================
#
# هذا السكريبت يقوم بجلب كل المستودعات العامة (public)
# في حساب GitHub الخاص بك، ثم يقوم بتحويلها إلى خاصة (private).
#
# متطلبات التشغيل:
#  - GitHub CLI (gh) مثبتة على جهازك
#  - jq مثبتة على جهازك (أداة لمعالجة JSON)
#  - تسجيل الدخول عبر الأمر: gh auth login
#
# طريقة الاستعمال:
# 1. افتح Terminal أو Git Bash.
# 2. نفذ 'gh auth login' وسجل دخولك.
# 3. نفذ هذا السكريبت: bash make-private.sh
#
# ملاحظة:
#  - السكريبت لا يمسح أي شيء، فقط يغير إعدادات الرؤية (visibility).
#  - تأكد من أنك تريد تحويل كل الريبو public إلى private.
#
# ============================================

USERNAME="youssefelalem"  # غيّر هذا لو حسابك مختلف

echo "🔍 جلب قائمة المستودعات العامة..."

# استخراج أسماء المستودعات العامة، تنظيف الأسطر من رموز CR (\r)، ثم التكرار على كل مستودع
gh repo list "$USERNAME" --limit 1000 --json name,visibility | jq -r '.[] | select(.visibility=="PUBLIC") | .name' | tr -d '\r' | while IFS= read -r repo; do
    echo "⏳ جاري تحويل المستودع \"$repo\" إلى خاص..."
    gh repo edit "$USERNAME/$repo" --visibility private --accept-visibility-change-consequences
    echo "✅ تم تحويل المستودع \"$repo\""
done

echo "🎉 انتهى السكريبت، تم تحويل جميع المستودعات العامة إلى خاصة."
