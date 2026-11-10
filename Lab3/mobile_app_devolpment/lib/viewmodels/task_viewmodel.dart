import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/task.dart';

// هذا الكلاس مسؤول عن إدارة منطق المهام (Logic)
// بعيدًا عن واجهات المستخدم (UI)
class TaskViewModel extends ChangeNotifier {

  // قائمة خاصة لتخزين المهام مؤقتًا داخل الذاكرة
  // لا نستخدم Database في هذه المرحلة
  final List<Task> _tasks = [];

  // Getter يسمح للواجهات بقراءة المهام
  // دون السماح لها بتعديل القائمة مباشرة
  List<Task> get tasks => List.unmodifiable(_tasks);

  // 1. إضافة مهمة جديدة
  void addTask(Task task) {
    // إضافة المهمة إلى القائمة
    _tasks.add(task);
    // إشعار الواجهات بأن قائمة المهام تغيرت
    notifyListeners();
  }

  // 2. تعديل مهمة موجودة
  void updateTask(Task updatedTask) {

    // البحث عن موقع المهمة باستخدام ID الفريد
    // ترجع indexWhere القيمة -1 إذا لم تجد المهمة
    final index = _tasks.indexWhere(
          (task) => task.id == updatedTask.id,
    );

    // التأكد من وجود المهمة
    if (index != -1) {

      // استبدال المهمة القديمة بالمهمة المعدلة
      _tasks[index] = updatedTask;

      // إشعار الواجهات بالتعديل
      notifyListeners();
    }
  }

  // 3. حذف مهمة باستخدام ID
  void deleteTask(String id) {

    // حذف المهمة التي يطابق ID الخاص بها المعرف المرسل
    _tasks.removeWhere(
          (task) => task.id == id,
    );

    // إشعار الواجهات بتغير القائمة
    notifyListeners();
  }

  // 4. حذف جميع المهام
  void deleteAllTasks() {

    // تفريغ قائمة المهام بالكامل
    _tasks.clear();

    // إشعار الواجهات بأن القائمة أصبحت فارغة
    notifyListeners();
  }

  // 5. تغيير حالة اكتمال المهمة
  void toggleTaskCompletion(String id) {

    // البحث عن موقع المهمة باستخدام ID
    final index = _tasks.indexWhere(
          (task) => task.id == id,
    );

    // التأكد من وجود المهمة
    if (index != -1) {

      // عكس حالة المهمة
      // false تصبح true والعكس
      _tasks[index].isCompleted =
      !_tasks[index].isCompleted;

      // إشعار الواجهات بتغيير حالة المهمة
      notifyListeners();
    }
  }

  // 6. الحصول على عدد المهام
  // إرجاع العدد الإجمالي للمهام
  int get totalTasks => _tasks.length;
  // إرجاع عدد المهام المكتملة
  int get completedTasks =>
      _tasks.where((task) => task.isCompleted).length;
  // إرجاع عدد المهام غير المكتملة
  int get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).length;
  /// التحقق من البيانات وإنشاء مهمة جديدة
  /// ترجع true عند نجاح الإضافة
  /// وترجع false إذا كان العنوان فارغًا
  bool addTaskFromInput({
    required String title,
    required String description,
    required DateTime date,
    required TimeOfDay time,
  }) {
    // تنظيف عنوان المهمة
    final cleanTitle = title.trim();

    // التحقق من صحة العنوان
    if (cleanTitle.isEmpty) {
      return false;
    }

    // إنشاء المهمة داخل ViewModel
    final task = Task.create(
      title: cleanTitle,
      description: description.trim(),
      date: date,
      time: time,
    );

    // إضافة المهمة إلى القائمة وإشعار الواجهة
    addTask(task);

    return true;
  }


  // التحقق من البيانات وتحديث مهمة موجودة
  bool updateTaskFromInput({
    required Task oldTask,
    required String title,
    required String description,
    required DateTime date,
    required TimeOfDay time,
  }) {
    // إزالة المسافات الزائدة
    final cleanTitle = title.trim();

    // التأكد من أن العنوان ليس فارغًا
    if (cleanTitle.isEmpty) {
      return false;
    }

    // البحث عن المهمة باستخدام ID
    final index = _tasks.indexWhere(
          (task) => task.id == oldTask.id,
    );

    // التأكد من وجود المهمة داخل القائمة
    if (index == -1) {
      return false;
    }

    // الاحتفاظ بحالة اكتمال المهمة
    final existingTask = _tasks[index];

    // إنشاء نسخة معدلة من المهمة
    final updatedTask = Task(
      id: existingTask.id,
      title: cleanTitle,
      description: description.trim(),
      date: date,
      time: time,
      isCompleted: existingTask.isCompleted,
    );

    // استدعاء دالة التحديث الأصلية
    updateTask(updatedTask);

    return true;
  }

}
