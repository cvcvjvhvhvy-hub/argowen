# Order Management App

تطبيق إدارة الطلبات للبقالات والتجار - نظام شامل لإدارة الطلبات والمناقصات.

## المميزات

- **تسجيل الدخول بالهاتف**: نظام آمن للمصادقة باستخدام Firebase Auth
- **إدارة المستخدمين**: دعم ثلاثة أنواع من المستخدمين (بقالة، تاجر، مدير)
- **إنشاء الفواتير**: إمكانية إنشاء فواتير مفصلة للطلبات
- **نظام المناقصات**: التجار يمكنهم تقديم عروض أسعار للطلبات
- **إدارة الطلبات**: تتبع حالة الطلبات من الإنشاء حتى الموافقة

## التقنيات المستخدمة

- **Flutter**: إطار العمل الأساسي للتطبيق
- **Firebase**: للمصادقة وقاعدة البيانات
  - Firebase Auth: للمصادقة
  - Cloud Firestore: لتخزين البيانات
  - Firebase Messaging: للإشعارات
- **Provider**: لإدارة الحالة
- **intl_phone_field**: لإدخال أرقام الهواتف

## متطلبات النظام

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Android SDK (للبناء على Android)
- Xcode (للبناء على iOS)

## التثبيت والإعداد

### 1. استنساخ المشروع
```bash
git clone <repository-url>
cd order_management_app
```

### 2. تثبيت التبعيات
```bash
flutter pub get
```

### 3. إعداد Firebase
1. إنشاء مشروع جديد في [Firebase Console](https://console.firebase.google.com/)
2. إضافة تطبيق Android/iOS للمشروع
3. تحميل ملف `google-services.json` ووضعه في `android/app/`
4. تحميل ملف `GoogleService-Info.plist` ووضعه في `ios/Runner/`
5. تشغيل الأمر التالي لإنشاء ملف Firebase options:
```bash
flutterfire configure
```

### 4. تفعيل خدمات Firebase
في Firebase Console، قم بتفعيل:
- Authentication (Phone authentication)
- Cloud Firestore
- Firebase Messaging (اختياري)

### 5. تشغيل التطبيق
```bash
flutter run
```

## بناء التطبيق للإنتاج

### Android
```bash
flutter build apk --release
# أو
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## هيكل المشروع

```
lib/
├── models/          # نماذج البيانات
│   ├── user.dart
│   ├── invoice.dart
│   └── bid.dart
├── providers/       # مقدمي الحالة
│   └── auth_provider.dart
├── screens/         # شاشات التطبيق
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   └── create_invoice_screen.dart
├── services/        # الخدمات
│   ├── auth_service.dart
│   └── firestore_service.dart
├── firebase_options.dart
└── main.dart
```

## أنواع المستخدمين

### 1. البقالة (Grocery)
- إنشاء فواتير جديدة
- عرض الطلبات الخاصة بهم
- قبول أو رفض العروض

### 2. التاجر (Merchant)
- عرض الطلبات المتاحة
- تقديم عروض أسعار
- إدارة العروض المقدمة

### 3. المدير (Admin)
- عرض جميع الطلبات والمستخدمين
- إدارة النظام
- مراقبة الأنشطة

## قواعد البيانات

### Users Collection
```json
{
  "id": "string",
  "name": "string",
  "phone": "string",
  "role": "grocery|merchant|admin",
  "address": "string"
}
```

### Invoices Collection
```json
{
  "id": "string",
  "groceryId": "string",
  "groceryName": "string",
  "phone": "string",
  "address": "string",
  "items": [
    {
      "name": "string",
      "quantity": "number"
    }
  ],
  "status": "pending|priced|approved",
  "lowestPrice": "number",
  "selectedMerchantId": "string",
  "createdAt": "timestamp"
}
```

### Bids Collection
```json
{
  "id": "string",
  "invoiceId": "string",
  "merchantId": "string",
  "price": "number",
  "createdAt": "timestamp"
}
```

## الأمان

- جميع العمليات محمية بمصادقة Firebase
- التحقق من صحة البيانات على مستوى العميل والخادم
- قواعد أمان Firestore لحماية البيانات

## المساهمة

1. Fork المشروع
2. إنشاء فرع للميزة الجديدة (`git checkout -b feature/AmazingFeature`)
3. Commit التغييرات (`git commit -m 'Add some AmazingFeature'`)
4. Push للفرع (`git push origin feature/AmazingFeature`)
5. فتح Pull Request

## الترخيص

هذا المشروع مرخص تحت رخصة MIT - راجع ملف [LICENSE](LICENSE) للتفاصيل.

## الدعم

للحصول على الدعم، يرجى فتح issue في GitHub أو التواصل عبر البريد الإلكتروني.