# Order Management App

تطبيق إدارة الطلبات للبقالات والتجار

## المتطلبات

1. Flutter SDK
2. Firebase Project
3. Android Studio / VS Code

## التثبيت

1. تثبيت التبعيات:
```bash
flutter pub get
```

2. تكوين Firebase:
   - إنشاء مشروع Firebase جديد
   - إضافة تطبيق Android/iOS
   - تحديث ملف `lib/firebase_options.dart` بالقيم الصحيحة
   - إضافة ملفات التكوين:
     - `android/app/google-services.json` للأندرويد
     - `ios/Runner/GoogleService-Info.plist` للـ iOS

3. تشغيل التطبيق:
```bash
flutter run
```

## الميزات

- تسجيل دخول بالهاتف (OTP)
- إنشاء فواتير للبقالات
- عرض العروض للتجار
- لوحة تحكم للمدير

## الأدوار

- **grocery**: البقالات - يمكنهم إنشاء فواتير
- **merchant**: التجار - يمكنهم عرض العروض
- **admin**: المدير - يمكنه إدارة النظام

## ملاحظات مهمة

1. يجب تكوين Firebase بشكل صحيح
2. تأكد من تفعيل Phone Authentication في Firebase
3. تأكد من تفعيل Firestore Database