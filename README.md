# GitHub Private Repos Script

هذا السكريبت يساعدك على تحويل جميع المستودعات العامة في حسابك على GitHub إلى مستودعات خاصة.

## المتطلبات

- GitHub CLI (gh) مثبت
- jq مثبت
- تسجيل الدخول عبر gh (gh auth login)

## طريقة الاستخدام

1. افتح الطرفية (Terminal / Git Bash).
2. نفذ الأمر التالي لتسجيل الدخول إذا لم تفعل:
   ```
   gh auth login
   ```
3. شغل السكريبت:
   ```
   bash make-private.sh
   ```
