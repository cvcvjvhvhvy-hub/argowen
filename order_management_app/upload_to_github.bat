@echo off
echo ===== رفع المشروع إلى GitHub =====
echo.
echo استبدل YOUR_GITHUB_USERNAME بـ اسم المستخدم الخاص بك
echo استبدل YOUR_REPOSITORY_NAME بـ اسم المشروع
echo.
echo مثال:
echo git remote add origin https://github.com/yourusername/order-management-app.git
echo.
pause
echo.
echo تشغيل الأوامر...
git branch -M main
echo تم إنشاء الفرع الرئيسي
echo.
echo الآن قم بتشغيل هذا الأمر مع بياناتك:
echo git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
echo git push -u origin main
pause