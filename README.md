# Order Management App

تطبيق إدارة الطلبات للبقالة والتجار

## البناء على Codemagic

### للنسخة التجريبية:
- استخدم workflow: `flutter-test-build`
- يبني APK بدون Firebase للاختبار

### للنسخة الإنتاجية:
- استخدم workflow: `flutter-production`
- يبني APK و AAB مع Firebase

## الملفات المهمة:
- `codemagic.yaml` - إعدادات البناء
- `lib/main.dart` - النسخة الرئيسية مع Firebase
- `lib/main_no_firebase.dart` - نسخة الاختبار بدون Firebase
- `android/app/google-services.json` - إعدادات Firebase

## خطوات البناء:
1. ارفع المشروع إلى Git repository
2. اربط Codemagic مع repository
3. اختر workflow المناسب
4. ابدأ البناء

## المتطلبات:
- Flutter 3.10.0+
- Dart 3.0.0+
- Android SDK