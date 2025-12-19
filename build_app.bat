@echo off
echo ========================================
echo بناء تطبيق Order Management App
echo ========================================

echo تنظيف المشروع...
flutter clean

echo تحميل التبعيات...
flutter pub get

echo فحص حالة Flutter...
flutter doctor

echo بناء APK للإصدار النهائي...
flutter build apk --release

if %ERRORLEVEL% EQU 0 (
    echo ========================================
    echo تم بناء التطبيق بنجاح!
    echo ملف APK متوفر في: build\app\outputs\flutter-apk\app-release.apk
    echo ========================================
) else (
    echo ========================================
    echo فشل في بناء التطبيق!
    echo تحقق من الأخطاء أعلاه
    echo ========================================
)

pause