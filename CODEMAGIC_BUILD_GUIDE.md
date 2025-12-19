# دليل البناء على Codemagic

## الخطوات المطلوبة قبل البناء:

### 1. إعداد Firebase
- إنشاء مشروع Firebase جديد على https://console.firebase.google.com
- تفعيل Authentication و Firestore Database
- تحميل ملف `google-services.json` الحقيقي ووضعه في `android/app/`
- تحديث `lib/firebase_options.dart` بالقيم الحقيقية من Firebase

### 2. إعداد Codemagic
1. تسجيل الدخول إلى https://codemagic.io
2. ربط المستودع (Repository)
3. اختيار workflow: `flutter-android`
4. إضافة متغيرات البيئة إذا لزم الأمر

### 3. ملفات التكوين المحدثة:
- ✅ `codemagic.yaml` - محدث للبناء الأمثل
- ✅ `android/build.gradle` - إضافة Google Services
- ✅ `android/app/build.gradle` - إضافة Firebase plugin
- ✅ `AndroidManifest.xml` - إضافة صلاحية الإنترنت
- ⚠️ `google-services.json` - يحتاج استبدال بالملف الحقيقي
- ⚠️ `firebase_options.dart` - يحتاج تحديث بالقيم الحقيقية

### 4. خطوات البناء:
1. رفع الكود إلى Git repository
2. في Codemagic، اختيار المشروع
3. تشغيل البناء
4. تحميل APK/AAB من Artifacts

### 5. ملاحظات مهمة:
- تأكد من تحديث Firebase configuration قبل البناء
- البناء سيفشل إذا لم يتم تحديث google-services.json
- يمكن تعطيل Firebase مؤقتاً للاختبار بتعديل main.dart

## حالة المشروع الحالية:
- ✅ التكوين الأساسي جاهز
- ⚠️ يحتاج تحديث Firebase credentials
- ✅ Codemagic configuration محدث