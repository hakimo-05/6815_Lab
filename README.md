# 6815_Lab — Mobile Application Development

مستودع التطبيقات العملية لمادة **Mobile Application Development**، ويجمع مراحل التدريب على **Flutter** و**Dart** بصورة مستقلة، مع توثيق التنفيذ والاختبارات لكل معمل.

## معلومات الطالب

| الحقل | التفاصيل |
|---|---|
| اسم الطالب | عبدالحكيم علي مبروك رحيل |
| الرقم الدراسي | 6815 |
| الجامعة | جامعة بنغازي |
| الكلية | كلية تقنية المعلومات |
| القسم | هندسة البرمجيات (Software Engineering) |
| العام الجامعي | 2026/2027 |

## المعامل (Labs)

| المعمل | الموضوع | ملخص العمل |
|---|---|---|
| [Lab 1](Lab1/) | **Flutter Lifecycle** | استخدام `WidgetsBindingObserver` لمراقبة حالات التطبيق وتسجيل الانتقالات مثل `inactive` و`paused` و`resumed`، وتجربة الخلفية والعودة. |
| [Lab 2](Lab2/) | **UI & Navigation** | بناء واجهات باستخدام Flutter Widgets وتجربة الانتقال بين الشاشات باستخدام `Navigator` و`MaterialPageRoute`. |
| [Lab 3](Lab3/mobile_app_devolpment/) | **To-Do Application · MVVM & State Management** | تطبيق إدارة مهام باستخدام `Provider` و`ChangeNotifier` مع وظائف إضافة وتعديل وحذف المهام، ومراقبة Lifecycle. |

> **ملاحظة بشأن أسماء المجلدات:** استخدمت الروابط أعلاه `Lab1` و`Lab2` على افتراض أن أسماء المجلدات بهذا الشكل. إذا كان الاسم الفعلي في GitHub مختلفًا، عدّل رابطَي Lab 1 وLab 2 ليتطابقا مع المستودع. مسار `Lab3/mobile_app_devolpment/` مطابق لمسار الملفات التي رُفعت.

## Lab 3 — تطبيق إدارة المهام (To-Do)

هذا المعمل هو المرحلة الأحدث في المستودع، وفيه طُوّر تطبيق Flutter مستقل لإدارة المهام، مع فصل منطق إدارة المهام عن واجهات المستخدم وفق مبادئ **Model–View–ViewModel (MVVM)**.

### الوظائف المنفذة

- عرض قائمة المهام مع عنوان ووصف وتاريخ ووقت لكل مهمة.
- إضافة مهمة جديدة والتحقق من عدم ترك العنوان فارغًا أو مكوّنًا من مسافات فقط.
- فتح مهمة موجودة، وعرض بياناتها وتعديلها مع الحفاظ على المعرّف `id`.
- حذف مهمة من شاشة التعديل أو بالسحب باستخدام `Dismissible`.
- تحديد مهمة كمكتملة وإلغاء اكتمالها.
- حذف جميع المهام بعد عرض حوار تأكيد، مع إمكانية الإلغاء.
- التنقل بين `My Tasks` و`Add Task` و`Update Task`.
- مراقبة دورة حياة التطبيق باستخدام `AppLifecycleObserver` المستقل.

### البنية التقنية

| الطبقة | الملفات/الدور |
|---|---|
| **Model** | `lib/models/task.dart` — بيانات المهمة ومعرّفها |
| **ViewModel** | `lib/viewmodels/task_viewmodel.dart` — قائمة `_tasks` والتحقق من المدخلات وإدارة الإضافة والتعديل والحذف والإشعار بالتغيير |
| **View** | `lib/views/` و`lib/utils/reuse/` — الشاشات والـWidgets وقراءة المدخلات وعرض النتائج |
| **State Management** | `Provider` و`ChangeNotifier` و`notifyListeners()` |
| **Lifecycle** | `lib/utils/lifecycle_observer.dart` |

**حدود النسخة:** لا توجد قاعدة بيانات أو تخزين دائم؛ المهام محفوظة في الذاكرة أثناء تشغيل التطبيق فقط. الاختبارات الوظيفية المذكورة في التوثيق **يدوية**، ولا يُدّعى تنفيذ اختبارات Unit Tests آلية.

### ملفات Lab 3 التفصيلية

- [مشروع Flutter كاملًا](Lab3/mobile_app_devolpment/)
- [README الخاص بالمشروع](Lab3/mobile_app_devolpment/README.md) — شرح الوظائف والبنية والتشغيل.
- [FINDINGS.md](Lab3/mobile_app_devolpment/FINDINGS.md) — نتائج اختبارات Lifecycle، واختبارات وظائف المهام، والملاحظات والإصلاحات.

## تشغيل Lab 3

يتطلب تشغيل المشروع وجود **Flutter SDK** و**Android Studio** وجهاز Android أو محاكي. انتقل إلى مجلد مشروع Flutter الذي يحتوي على `pubspec.yaml`، ثم نفذ:

```bash
cd Lab3/mobile_app_devolpment
flutter pub get
flutter run
```

يمكن تنفيذ `flutter analyze` و`flutter test` للفحص محليًا. لا تعني الإشارة إليهما أن هذه الفحوصات نُفذت بنجاح مسبقًا.

## تطور العمل

تدرّج العمل من مراقبة دورة حياة التطبيق في **Lab 1**، إلى تطوير الواجهات والتنقل في **Lab 2**، ثم بناء تطبيق To-Do بواجهات قابلة لإعادة الاستخدام وإدارة حالة باستخدام **MVVM** في **Lab 3**. بقي كل معمل في مجلد مستقل للمراجعة والتقييم.

## مراجع تقنية

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter App Lifecycle](https://docs.flutter.dev/ui/lifecycle)
- [Flutter State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/intro)
- [Provider](https://pub.dev/packages/provider)
