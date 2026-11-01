# Mobile Application Development – Laboratory Work

## معلومات الطالب (Student Information)

**اسم الطالب:** عبدالحكيم علي مبروك رحيل  
**الرقم الدراسي:** 6815  
**الجامعة:** جامعة بنغازي  
**الكلية:** كلية تقنية المعلومات  
**القسم:** هندسة البرمجيات (Software Engineering)  
**المادة:** Mobile Application Development  
**العام الجامعي:** 2026/2027

---

## 1. نبذة عن العمل (Overview)

يحتوي هذا المستودع (Repository) على الأعمال والتطبيقات العملية التي قمت بتنفيذها خلال معامل مادة Mobile Application Development.

استخدمت Flutter وDart في تنفيذ التطبيقات، وAndroid Studio لكتابة الأكواد وتشغيل المشاريع، بالإضافة إلى Git وGitHub لتنظيم الملفات وحفظ التعديلات ومشاركة العمل مع الأستاذ.

قمت بتنظيم كل Lab داخل مجلد مستقل يحتوي على ملفات المشروع والأكواد والتوثيق الخاص به.

---

## 2. المعامل المنفذة (Completed Labs)

### Lab 1 – Flutter Application Lifecycle

في المعمل الأول، قمت بالتعرف على دورة حياة التطبيق (Application Lifecycle) في Flutter، وكيفية مراقبة الحالات التي يمر بها التطبيق أثناء التشغيل.

استخدمت `WidgetsBindingObserver` والدالة `didChangeAppLifecycleState()` لمراقبة تغيّرات دورة الحياة، وطباعة الحالات في سجل التشغيل (Logcat).

**التجارب التي قمت بها:**

1. الخروج من التطبيق والعودة إليه.
2. تدوير الهاتف بين Portrait وLandscape.
3. فتح تطبيق آخر ثم العودة إلى التطبيق.
4. إزالة التطبيق من قائمة Recent Apps.

لاحظت ظهور حالات مثل `inactive` و`hidden` و`paused` و`resumed` أثناء الانتقال بين التطبيق والخلفية.

كما قارنت هذه الحالات بأحداث دورة الحياة الستة في .NET MAUI.

**ملفات المعمل:**

- `Lab1/mobile_app_dev/lib/` — الأكواد البرمجية.
- `Lab1/mobile_app_dev/README.md` — شرح المعمل.
- `Lab1/mobile_app_dev/findings.md` — نتائج التجارب والملاحظات.

### Lab 2 – Flutter UI Design & Navigation

في المعمل الثاني، قمت بتصميم عدة واجهات باستخدام Flutter، وتطبيق التنقل بينها باستخدام Navigation.

يرتبط موضوع هذا المعمل بملف Lab 4 – Navigation & Architecture الذي قدمه الأستاذ، وقد نفذت الجزء الأساسي من التنقل باستخدام Flutter.

**الشاشات التي قمت بإنشائها:**

1. Home – الشاشة الرئيسية.
2. Notes – شاشة الملاحظات.
3. Details – شاشة التفاصيل.
4. Edit – شاشة التعديل.

استخدمت `Scaffold` و`AppBar` و`Drawer` و`Container` لتصميم الواجهات.

كما استخدمت `Navigator.push()` للانتقال بين الصفحات، و`Navigator.pushReplacement()` للانتقال إلى الشاشة الرئيسية مع استبدال الصفحة الحالية.

**مسار التنقل:**

`Home → Notes → Details → Edit`

**ملفات المعمل:**

- `Lab2/mobile_app_dev/lib/main.dart`
- `Lab2/mobile_app_dev/lib/home.dart`
- `Lab2/mobile_app_dev/lib/notes.dart`
- `Lab2/mobile_app_dev/lib/detiels.dart`
- `Lab2/mobile_app_dev/lib/edite.dart`
- `Lab2/mobile_app_dev/README.md`

---

## 3. التقنيات والأدوات المستخدمة (Technologies & Tools)

| التقنية | الاستخدام |
|---|---|
| Flutter | تطوير واجهات التطبيق |
| Dart | كتابة الأكواد البرمجية |
| Android Studio | تطوير وتشغيل المشروع |
| Android Emulator | تجربة التطبيق على المحاكي |
| Git | تتبع التعديلات |
| GitHub | حفظ ومشاركة المستودع |
| .NET MAUI | المقارنة في Lab 1 والمرجع النظري لموضوع Navigation |

---

## 4. تنظيم الملفات (Project Structure)

تم تنظيم المعامل داخل مجلد رئيسي باسم `6815_Lab`.

يحتوي كل معمل على مشروع Flutter مستقل، بالإضافة إلى ملف `README.md` الذي يوضح الهدف وطريقة التنفيذ.

يحتوي Lab 1 أيضًا على ملف `findings.md` لتوثيق نتائج اختبار دورة حياة التطبيق.

أما المجلدات الأخرى، فسيتم تحديث توثيقها عند تنفيذ المعامل الخاصة بها.

---

## 5. ما تعلمته (Learning Outcomes)

من خلال المعملين، تعلمت كيفية مراقبة دورة حياة تطبيق Flutter، والتعامل مع حالات الانتقال بين التطبيق والخلفية.

كما تعلمت أساسيات تصميم واجهات المستخدم (UI)، وتقسيم التطبيق إلى شاشات منفصلة، واستخدام `Navigator` للانتقال بينها.

وتعرفت أيضًا على أهمية تنظيم الأكواد والملفات وتوثيق العمل باستخدام Markdown، وإدارة إصدارات المشروع باستخدام Git وGitHub.

---

## 6. ملاحظات (Notes)

- تم توثيق Lab 1 وLab 2 بناءً على الأكواد والتجارب التي نفذتها.
- ملف `findings.md` يحتوي على نتائج اختبار Lab 1.
- لم يتم اعتبار الاختبارات أو الوظائف غير المنفذة نتائج مكتملة.
- سيتم تحديث المستودع عند تنفيذ المعامل القادمة.

---

**University of Benghazi – Faculty of Information Technology**  
**Software Engineering Department – 2026/2027**