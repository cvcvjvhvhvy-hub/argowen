# تعليمات البناء - Order Management App

## المتطلبات المسبقة
1. تثبيت Flutter SDK (الإصدار 3.10.0 أو أحدث)
2. تثبيت Android Studio مع Android SDK
3. تثبيت Java JDK 11 أو أحدث

## خطوات البناء

### 1. إعداد البيئة
```bash
# تحقق من تثبيت Flutter
flutter doctor

# إعداد مسارات SDK في android/local.properties
# تأكد من أن المسارات صحيحة لنظامك
```

### 2. تنظيف المشروع
```bash
cd order_management_app
flutter clean
flutter pub get
```

### 3. بناء التطبيق

#### للتطوير (Debug)
```bash
flutter build apk --debug
```

#### للإنتاج (Release)
```bash
flutter build apk --release
```

#### بناء Bundle للنشر على Google Play
```bash
flutter build appbundle --release
```

## الإصلاحات المطبقة

✅ تحديث Android Gradle Plugin إلى 8.1.4
✅ تحديث Kotlin إلى 1.8.22
✅ تحديث Gradle Wrapper إلى 8.4
✅ تحديث compileSdk إلى 34
✅ تحديث Java إلى الإصدار 11
✅ إضافة multiDexEnabled
✅ تحديث مكتبات Firebase
✅ إضافة قواعد ProGuard
✅ إصلاح مشكلة Android Embedding v1

## ملاحظات مهمة
- تأكد من تحديث مسارات SDK في android/local.properties
- في حالة مواجهة مشاكل، قم بحذف مجلد build وأعد البناء
- تأكد من اتصال الإنترنت لتحميل التبعيات

## استكشاف الأخطاء
إذا واجهت مشاكل:
1. `flutter clean && flutter pub get`
2. احذف مجلد `android/.gradle`
3. احذف مجلد `build`
4. أعد البناء