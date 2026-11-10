# Lab 3 — تطبيق إدارة المهام (To-Do) باستخدام Flutter وMVVM

> **تحديث التوثيق:** 11 نوفمبر 2026 — توسعة للملف السابق بعد إكمال سلوك الأزرار واختبار إدارة المهام وفصل منطق الإضافة والتعديل عن الواجهة.  
> **الحالة:** وظائف التطبيق الأساسية تعمل وفق الاختبارات اليدوية التي أكدها الطالب؛ البيانات مؤقتة في الذاكرة، دون قاعدة بيانات أو تخزين دائم.

## معلومات الطالب

- **اسم الطالب:** عبدالحكيم علي مبروك رحيل
- **الرقم الدراسي:** 6815
- **الجامعة:** جامعة بنغازي
- **الكلية:** كلية تقنية المعلومات
- **القسم:** هندسة البرمجيات (Software Engineering)
- **المادة:** Mobile Application Development
- **العام الجامعي:** 2026/2027
- **مستودع المعامل:** https://github.com/hakimo-05/6815_Lab

## 1. نبذة عن المشروع

**Lab 3** مشروع مستقل لتطبيق **To-Do** باستخدام **Flutter** و**Dart**. الغرض منه تطبيق بناء واجهات المستخدم (**UI**)، وإعادة استخدام الـWidgets، والتنقل (**Navigation**)، ومراقبة دورة حياة التطبيق (**Lifecycle**)، وإدارة الحالة وفصل المسؤوليات بأسلوب **MVVM** باستخدام حزمة **Provider**.

يمثل هذا الإصدار تطورًا عن النسخة الأولى من التوثيق: لم يعد المشروع واجهات وتنقلًا فقط؛ بل أصبحت الأزرار تؤدي وظائف فعلية، وتُعرض بيانات كل مهمة من قائمة ديناميكية داخل `TaskViewModel`. ولا تُستخدم `Database` أو خدمة خارجية؛ المهام محفوظة في ذاكرة التطبيق فقط.

## 2. الوظائف المنفذة (Features)

| الوظيفة | طريقة العمل | الحالة |
|---|---|---|
| عرض المهام | قائمة ديناميكية تعرض العنوان والوصف والوقت والتاريخ | منفذة ومختبرة يدويًا |
| إضافة مهمة `Add Task` | إدخال عنوان ووصف واختيار تاريخ ووقت، ثم حفظها في قائمة المهام | منفذة ومختبرة |
| التحقق من العنوان `Validation` | رفض العنوان الفارغ أو المؤلف من مسافات فقط مع `SnackBar` | منفذة ومختبرة |
| تعديل مهمة `Update Task` | فتح الكارت، تعبئة البيانات السابقة، حفظ التغييرات بنفس `id` | منفذة ومختبرة |
| حذف مهمة `Delete Task` | حذف المهمة المحددة من شاشة التعديل | منفذة ومختبرة |
| حذف بالسحب `Swipe to Delete` | تمرير الكارت باستخدام `Dismissible` وحذف العنصر مباشرة | منفذة ومختبرة |
| اكتمال المهمة `Toggle Completion` | الضغط على دائرة الحالة لتغيير `isCompleted` وتحديث المظهر | منفذة ومختبرة |
| حذف جميع المهام `Delete All` | أيقونة في `AppBar` مع رسالة تأكيد و`Cancel` | منفذة ومختبرة |
| التنقل `Navigation` | الانتقال بين `My Tasks` و`Add Task` و`Update Task` والعودة بعد الحفظ | منفذ ومختبر |
| مراقبة دورة الحياة `Lifecycle` | `AppLifecycleObserver` يسجّل تغيرات `AppLifecycleState` مع الوقت | منفذة ومختبرة |
| تخزين دائم `Persistence` | لا توجد قاعدة بيانات أو حفظ عند إعادة فتح التطبيق | خارج نطاق الإصدار |

## 3. تقنيات المشروع

- **Flutter / Dart:** بناء التطبيق والواجهات.
- **Provider:** ربط الواجهة بالـ`TaskViewModel` وإدارة الحالة.
- **ChangeNotifier / notifyListeners():** إشعار الشاشات عندما تتغير قائمة المهام.
- **uuid:** إنشاء معرّف `id` فريد لكل مهمة من خلال `Task.create()`.
- **WidgetsBindingObserver:** رصد أحداث Lifecycle.
- **Navigator / MaterialPageRoute:** التنقل بين الشاشات.
- **TextEditingController / showDatePicker / showTimePicker:** التعامل مع مدخلات نموذج المهمة.

الحزمتان الخارجيتان اللتان أُضيفتا أثناء التنفيذ هما `provider` و`uuid`. يُرجى الرجوع إلى ملف `pubspec.yaml` داخل المشروع لمعرفة إصداراتهما المعتمدة وقت تشغيل النسخة المرفوعة.

## 4. تنظيم الملفات (Project Structure)

المسارات الرئيسية وفق الملفات المستخدمة في تنفيذ هذه المرحلة:

```text
lib/
├── main.dart
├── models/
│   └── task.dart
├── viewmodels/
│   └── task_viewmodel.dart
├── views/
│   ├── screens/
│   │   ├── mytask_screen.dart
│   │   ├── addtask_screen.dart
│   │   └── updatetask.dart
│   └── widgets/
│       └── mytaskswidgets/
│           └── listtasks.dart
└── utils/
    ├── lifecycle_observer.dart
    ├── colors.dart
    ├── vairables.dart
    └── reuse/
        ├── appbar.dart
        ├── body_addupdatetask.dart
        ├── buttons_add_update_delete.dart
        ├── field_enter_titleanddescribtion.dart
        └── selectdatetime.dart

README.md
FINDINGS.md
```

> هذه شجرة لأهم ملفات التطبيق، وليست حصرًا لجميع ملفات Flutter المولَّدة تلقائيًا. يحتفظ المشروع الأصلي أيضًا بالمجلدات المعتادة مثل `android/` و`test/` وملف `pubspec.yaml` بحسب بنيته الفعلية.

## 5. تطبيق MVVM وفصل المسؤوليات

### Model — `lib/models/task.dart`

يمثّل `Task` بيانات المهمة: `id`، `title`، `description`، `date`، `time`، `isCompleted`. ويُستخدم `Task.create()` لتجهيز مهمة جديدة مع معرّف فريد وقيم أولية عند الحاجة. الـModel لا يرسم واجهة ولا ينفذ التنقل.

### ViewModel — `lib/viewmodels/task_viewmodel.dart`

يرث `TaskViewModel` من `ChangeNotifier`، ويحتفظ بالقائمة الخاصة `List<Task> _tasks`، ويوفر واجهة قراءة `List.unmodifiable(_tasks)` حتى لا تعدّل الـView القائمة مباشرة. من الدوال والخصائص المستخدمة:

| الدالة/الخاصية | مسؤوليتها |
|---|---|
| `tasks` | قراءة قائمة المهام للعرض |
| `addTaskFromInput(...)` | تنظيف المدخلات، التحقق من العنوان، إنشاء `Task` ثم طلب إضافتها |
| `addTask(Task task)` | إدراج المهمة في `_tasks` وإشعار المستمعين |
| `updateTaskFromInput(...)` | التحقق من المدخلات، البحث بالـ`id`، تجهيز المهمة المعدلة مع حفظ حالة الاكتمال |
| `updateTask(Task updatedTask)` | استبدال المهمة الموجودة وإشعار المستمعين |
| `deleteTask(String id)` | حذف مهمة حسب معرفها |
| `deleteAllTasks()` | إفراغ القائمة |
| `toggleTaskCompletion(String id)` | عكس قيمة `isCompleted` |
| `totalTasks`، `completedTasks`، `pendingTasks` | قيم محسوبة من حالة القائمة |

### View — الشاشات والـWidgets

- **`MytaskScreen`** تعرض قائمة المهام وتوفّر التنقل إلى إضافة مهمة، وزر حذف الجميع.
- **`ListTasks`** تستخدم `context.watch<TaskViewModel>()`، وتبني الكروت من `tasks` مع مفتاح `ValueKey(task.id)`، وتوفّر الضغط للتعديل، والسحب للحذف، وتغيير الاكتمال.
- **`AddtaskScreen` و`Updatetask`** تعيدان استخدام `BodyAddupdatetask`، مع تمرير `Task? task` فقط عند تعديل مهمة موجودة.
- **`BodyAddupdatetask`** تدير `TextEditingController` ونافذتي اختيار التاريخ والوقت، وتقرأ المدخلات وتستدعي `ViewModel`، ثم تعرض `SnackBar` أو تستخدم `Navigator.pop()` حسب نتيجة العملية.
- **`ButtonsAddUpdateDelete`** تستقبل دوال `VoidCallback` (`onAddTask` و`onUpdateTask` و`onDeleteTask`) ولا تحتوي على منطق تخزين المهام.
- **`appbar.dart`** يعرض حوار تأكيد `Delete All`، ثم يطلب الحذف عبر `onDeleteAllConfirmed` عند التأكيد فقط.

### مسار البيانات بعد العزل

```text
Add Task Button (View)
    -> addNewTask() (View)
    -> addTaskFromInput() (ViewModel: validation + Task.create)
    -> addTask() (ViewModel: _tasks.add + notifyListeners)
    -> context.watch<TaskViewModel>() in ListTasks (UI rebuild)

Update Task Button (View)
    -> updateExistingTask() (View)
    -> updateTaskFromInput() (ViewModel: validation + same id)
    -> updateTask() (ViewModel: replace + notifyListeners)
    -> My Tasks shows updated values
```

**ملاحظة تقنية:** اختيار التاريخ والوقت و`TextEditingController` حالة مؤقتة مرتبطة بالنموذج، لذلك بقيا في الـView. فصل منطق المهام عن الواجهة **محسّن** لكنه لا يعني أن جميع أنواع البيانات مستقلة عن Flutter، لأن `TimeOfDay` ما زال مستخدمًا في الـModel/الـViewModel.

## 6. مراقبة دورة حياة التطبيق (Lifecycle Refactoring)

في **Lab 1** كان مراقب دورة الحياة مرتبطًا مباشرة بـ`main.dart`. في **Lab 3** فُصل إلى `AppLifecycleObserver` داخل `lib/utils/lifecycle_observer.dart`، ثم وُضع حول التطبيق الرئيسي:

```dart
void main() {
  runApp(
    const AppLifecycleObserver(
      child: MyApp(),
    ),
  );
}
```

يستخدم هذا الكلاس `WidgetsBindingObserver` ويسجّل نفسه في `initState()`، ويرصد `didChangeAppLifecycleState()`، ويزيل التسجيل في `dispose()`؛ ويطبع الحالات مع توقيتها بواسطة `debugPrint()`. هذا التعديل يحسّن **Separation of Concerns** و**Readability** و**Maintainability** و**Reusability**، من غير تغيير طريقة رسم الواجهات.

### النتائج المسجَّلة يوم 10 نوفمبر 2026

أُجريت التجارب على جهاز Android ظهر في سجل التشغيل باسم `ABR NX1`:

| التجربة | ما رُصد |
|---|---|
| بدء المراقب | `[Lifecycle] Observer initialized` |
| الخروج للخلفية والعودة | `inactive → hidden → paused` ثم `hidden → inactive → resumed` |
| التنقل إلى شاشة أخرى ثم الخلفية والعودة | استمرت المراقبة وسجلت انتقالات الحالة |
| فتح تطبيق آخر والعودة | رُصدت حالات الخلفية ثم `resumed` |
| الإزالة من `Recent Apps` | رُصدت حالات الخلفية، دون دليل قاطع على حدث إنهاء |
| التدوير `Portrait/Landscape` | رُصدت `ROTATION_90` و`ROTATION_0` وتحديثات `viewport metrics` |

للحصول على سجلات الأوقات الدقيقة وشرح حدود الاستنتاج، راجع [`FINDINGS.md`](FINDINGS.md).

## 7. الاختبارات الوظيفية (Functional Testing)

بعد تنفيذ وظائف المهام، أكّد الطالب نجاح الاختبارات اليدوية التالية في التطبيق:

1. إضافة مهمة صحيحة والرجوع تلقائيًا إلى `My Tasks`.
2. رفض الإضافة عندما يكون العنوان فارغًا، مع ظهور رسالة مناسبة.
3. عرض البيانات الصحيحة لكل مهمة في `ListTasks`.
4. فتح شاشة التعديل محمّلة بالعنوان والوصف والتاريخ والوقت السابقين.
5. تعديل مهمة موجودة بنفس `id`، دون إضافة نسخة أخرى، ورفض التعديل بعنوان فارغ.
6. حذف مهمة من شاشة التعديل أو بالسحب على الكارت.
7. تغيير حالة الاكتمال وإعادتها.
8. إلغاء عملية `Delete All` عبر `Cancel`، ثم تأكيدها واختفاء المهام.

لم تُنفَّذ في هذه المرحلة **Unit Tests آلية موثّقة**؛ نتائج هذه القائمة اختبار يدوي أبلغ الطالب بنجاحه. التفاصيل في [`FINDINGS.md`](FINDINGS.md).

## 8. التشغيل (How to Run)

1. افتح مجلد مشروع Flutter الموجود داخل `Lab 3` في **Android Studio**، وليس مجلد المعامل كله كمشروع Flutter واحد.
2. تأكد من تثبيت **Flutter SDK** وتوفّر جهاز Android أو Emulator.
3. من Terminal داخل مجلد المشروع الذي يحوي `pubspec.yaml` شغّل:

   ```bash
   flutter pub get
   flutter run
   ```

4. افتح `My Tasks`، وأضف مهمة، ثم جرّب التعديل والحذف وتغيير الاكتمال والحذف الجماعي.
5. عند اختبار الـLifecycle، راقب `Run Console` وابحث عن `[Lifecycle]`، ثم جرّب الخلفية والعودة.

لتشغيل فحوصات ثابتة عند توفر بيئة Flutter محليًا:

```bash
flutter analyze
flutter test
```

**تنبيه:** الأمران أعلاه مقترحان للتحقق قبل التسليم؛ لا يعني ذكرهما هنا أننا شغّلناهما أو أثبتنا نجاحهما.

## 9. ملاحظات وقيود النسخة الحالية

- **لا توجد قاعدة بيانات:** `_tasks` قائمة RAM داخل `TaskViewModel`. البيانات تختفي عند إعادة تشغيل عملية التطبيق بالكامل.
- **لا توجد مزامنة أو Backend أو إشعارات مجدولة** في هذه النسخة.
- استخدام `Provider` و`ChangeNotifier` يفصل منطق إدارة المهام عن أغلب الـUI، ولا يثبت وحده اكتمال جميع معايير الاختبارات الآلية أو العزل عن Flutter.
- المشروع الحالي **تطبيق To-Do ضمن Lab 3**، وليس نسخًا حرفيًا من مشروع Profile الخاص بتعليمات **Lab 5 .NET MAUI**؛ طُبّقت منه مبادئ إدارة الحالة وMVVM بما يناسب Flutter.

## 10. تطور العمل عبر المعامل

- **Lab 1:** تعلّم Flutter Lifecycle وتسجيل حالات التطبيق.
- **Lab 2:** التمرن على بناء UI والتنقل بين الشاشات.
- **Lab 3:** مشروع To-Do مستقل، وإعادة استخدام Widgets، وفصل Lifecycle، وتنفيذ وظائف إدارة المهام، واعتماد `Provider` و`TaskViewModel` لإدارة الحالة.

حُفظت المعامل السابقة مستقلة؛ لا تُنسب اختبارات Lab 3 إلى Lab 1 أو العكس.

## 11. توثيق المشكلات والإصلاحات

توجد في [`FINDINGS.md`](FINDINGS.md) تفاصيل إصلاح خطأ عكس قيمة `isAdded` باستخدام `!`، وإضافة الدالة `updateTaskFromInput()`، وحل مشكلة `Task?` عند إعادة استخدام الشاشة، وتجنب مشكلة `Dismissible` مع بيانات ثابتة.

## 12. رفع Lab 3 إلى GitHub

احفظ `README.md` و`FINDINGS.md` في **مجلد Lab 3 نفسه، بجوار ملف `pubspec.yaml` الخاص بمشروع Flutter**، ولا تضعهما داخل `lib/`. ثم من جذر مستودع `6815_Lab` راجع التغييرات قبل الرفع:

```bash
git status
git add "Lab 3/"
git commit -m "Lab 3: complete To-Do MVVM features and update documentation"
git push origin main
```

> إذا كان اسم المجلد في جهازك مختلفًا (مثل `Lab3`)، استخدم اسمه الحقيقي في `git add`. وتأكد من وجود `.gitignore` مناسب حتى لا تُرفع مجلدات البناء المؤقتة مثل `build/` و`.dart_tool/`.

## 13. المراجع

- [Flutter — App Lifecycle](https://docs.flutter.dev/ui/lifecycle)
- [Flutter — Navigation and Routing](https://docs.flutter.dev/ui/navigation)
- [Flutter API — WidgetsBindingObserver](https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html)
- [Flutter — State management](https://docs.flutter.dev/data-and-backend/state-mgmt/intro)
- [Provider package](https://pub.dev/packages/provider)
- [uuid package](https://pub.dev/packages/uuid)
