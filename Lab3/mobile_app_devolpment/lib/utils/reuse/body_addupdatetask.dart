import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_devolpment/models/task.dart';
import 'package:mobile_app_devolpment/viewmodels/task_viewmodel.dart';

import 'buttons_add_update_delete.dart';
import '../colors.dart';
import 'field_enter_titleanddescribtion.dart';
import 'selectdatetime.dart';

class BodyAddupdatetask extends StatefulWidget {
  const BodyAddupdatetask({
    super.key,
    required this.titleScreen,
    required this.isUpdateTaskScreen,
    this.task,
  });

  final String titleScreen;
  final bool isUpdateTaskScreen;
  final Task? task;

  @override
  State<BodyAddupdatetask> createState() => _BodyAddupdatetaskState();
}

class _BodyAddupdatetaskState extends State<BodyAddupdatetask> {

  // Controller لقراءة عنوان المهمة
  final TextEditingController titleController = TextEditingController();
  // Controller لقراءة وصف المهمة
  final TextEditingController descriptionController = TextEditingController();
  // تخزين التاريخ المختار
  DateTime selectedDate = DateTime.now();
  // تخزين الوقت المختار
  TimeOfDay selectedTime = TimeOfDay.now();
  // تحديث بيانات مهمه موجودة سابقا

  void updateExistingTask() {
    // الحصول على المهمة القديمة
    final oldTask = widget.task;
    // التأكد من وجود مهمة لتعديلها
    if (oldTask == null) return;
    // إرسال البيانات الجديدة إلى ViewModel
    final isUpdated =
    context.read<TaskViewModel>().updateTaskFromInput(
      oldTask: oldTask,
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDate,
      time: selectedTime,
    );

    // عرض رسالة إذا فشل التحديث
    if (!isUpdated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to update task. Check the title.'),
        ),
      );
      return;
    }

    // الرجوع إلى My Tasks عند نجاح التعديل
    Navigator.pop(context);
  }
  // دالة حذف المهمة الحالية
  void deleteCurrentTask() {
    // الحصول على المهمة المفتوحة في شاشة Update
    final task = widget.task;

    // التأكد من وجود مهمة
    if (task == null) return;

    // إرسال معرف المهمة إلى ViewModel لحذفها
    context.read<TaskViewModel>().deleteTask(task.id);

    // الرجوع إلى شاشة My Tasks
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    // جلب بيانات المهمة التي تم تمريرها من شاشة My Tasks
    final task = widget.task;
    // إذا كانت المهمة موجودة، نعرض بياناتها القديمة
    if (task != null) {
      // تعبئة حقل العنوان
      titleController.text = task.title;
      // تعبئة حقل الوصف
      descriptionController.text = task.description;
      // إظهار التاريخ والوقت المحفوظين
      selectedDate = task.date;
      selectedTime = task.time;
    }
  }

  void addNewTask() {
    // قراءة البيانات التي أدخلها المستخدم من الواجهة
    final title = titleController.text;
    final description = descriptionController.text;
    // إرسال البيانات إلى ViewModel للتحقق منها وإضافة المهمة
    final isAdded = context.read<TaskViewModel>().addTaskFromInput(
      title: title,
      description: description,
      date: selectedDate,
      time: selectedTime,
    );

    // إذا رفض ViewModel الإضافة، نعرض رسالة للمستخدم
    if (!isAdded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter task title'),
        ),
      );
      return;
    }

    // إذا نجحت الإضافة، نرجع إلى شاشة My Tasks
    Navigator.pop(context);
  }

  // تحرير Controllers عند إغلاق الشاشة
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عنوان الشاشة
        Row(
          children: [
            const Expanded(child: Divider(indent: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.titleScreen,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),

        const SizedBox(height: 20),

        const Text(
          'What are you planing?',
          style: TextStyle(color: grey, fontSize: 16),
        ),

        // حقل إدخال عنوان المهمة
        FieldEnterTitleAndDescribtion(
          maxLines: 8,
          minLines: 4,
          isDescribtion: false,
          controller: titleController,
        ),

        const SizedBox(height: 30),

        // حقل إدخال وصف المهمة
        FieldEnterTitleAndDescribtion(
          maxLines: 2,
          minLines: 1,
          isDescribtion: true,
          controller: descriptionController,
        ),

        const SizedBox(height: 30),

        // اختيار الوقت
        SelectDateTime(
          titleDateOrTime: 'Time',
          ValueDateOrTime: selectedTime.format(context),

          onTap: () async {
            // فتح نافذة اختيار الوقت
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );

            // تحديث الوقت المعروض
            if (pickedTime != null && mounted) {
              setState(() {
                selectedTime = pickedTime;
              });
            }
          },
        ),

        const SizedBox(height: 25),

        // اختيار التاريخ
        SelectDateTime(
          titleDateOrTime: 'Date',
          ValueDateOrTime:
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',

          onTap: () async {
            // فتح نافذة اختيار التاريخ
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2026),
              lastDate: DateTime(2030),
            );

            // تحديث التاريخ المعروض
            if (pickedDate != null && mounted) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
        ),

        const SizedBox(height: 55),

        // أزرار إضافة أو تعديل أو حذف المهمة
        ButtonsAddUpdateDelete(
          isUpdateTaskScreen: widget.isUpdateTaskScreen,
          // ربط زر Add Task بدالة الإضافة
          onAddTask: addNewTask,
          onUpdateTask: updateExistingTask,
          onDeleteTask: deleteCurrentTask,
        ),
      ],
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:mobile_app_devolpment/utils/reuse/selectdatetime.dart';

import 'buttons_add_update_delete.dart';
import '../colors.dart';
import '../vairables.dart';
import 'field_enter_titleanddescribtion.dart';

class BodyAddupdatetask extends StatefulWidget {
  const BodyAddupdatetask({super.key, required this.titleScreen, required this.isUpdateTaskScreen});

  final String titleScreen;
  final bool isUpdateTaskScreen;

  @override
  State<BodyAddupdatetask> createState() => _BodyAddupdatetaskState();
}

class _BodyAddupdatetaskState extends State<BodyAddupdatetask> {

  // تخزين التاريخ المختار
  DateTime selectedDate = DateTime.now();
// تخزين الوقت المختار
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // لوضع العناصر افقيا
        Row(
          children: [
            // تجعل الويدجت تمتد لاقصى مساحة ممكنة
            Expanded(child: Divider(indent: 1)),
            //تدير للتحكم في المسافات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.titleScreen,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            // تجعل الويدجت تمتد لاقصى مساحة ممكنة
            Expanded(child: Divider()),
          ],
        ),
        // تاخذ مسافة افقيا بمقدار محدد
        SizedBox(height: 20),
        //لاضافة نص و وضع خصائصة
        const Text(
          'What are you planing?',
          style: TextStyle(color: grey, fontSize: 16),
        ),
        // حقل لادخال عنوان المهمة
        FieldEnterTitleAndDescribtion(
          maxLines: 8,
          minLines: 4,
          isDescribtion: false,
        ),
        SizedBox(height: 30),
        // حقل لادخال وصف المهمة
        FieldEnterTitleAndDescribtion(
          maxLines: 2,
          minLines: 1,
          isDescribtion: true,
        ),
        // مسافة راسية
        SizedBox(height: 30),
        //اعادة استخدام لحاوية للوقت مع مراعاة المعايير
        SelectDateTime(
          titleDateOrTime: 'Time',
          // عرض الوقت الذي اختاره المستخدم
          ValueDateOrTime: selectedTime.format(context),
          onTap: () async {
            // فتح نافذة اختيار الوقت وانتظار النتيجة
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );
            // تحديث الوقت إذا اختار المستخدم قيمة
            if (pickedTime != null && mounted) {
              setState(() {
                selectedTime = pickedTime;
              });
            }
          },
        ),
        // مسافة بين حاوية التاريخ و حاوية الوقت
        SizedBox(height: 25),
        //اعادة استخداملحاوية  للتاريخ مع مراعاة المعايير

        SelectDateTime(
          titleDateOrTime: 'Date',
          // عرض التاريخ المختار بصيغة يوم/شهر/سنة
          ValueDateOrTime:
          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',

          onTap: () async {

            // فتح التقويم وانتظار اختيار التاريخ
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2026),
              lastDate: DateTime(2030),
            );

            // التأكد من اختيار تاريخ وعدم إلغاء العملية
            if (pickedDate != null && mounted) {

              // حفظ التاريخ الجديد وتحديث الواجهة
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
        ),

        // مسافة راسية
        SizedBox(height: 55),
        //   استدعاء بطمة اذا كانت في شاشة اضافة مهمة جديدة و بطمتين اذا كانت لتحديث مهمه موجودة سابقا
        ButtonsAddUpdateDelete(isUpdateTaskScreen: widget.isUpdateTaskScreen,),
      ],
    );
  }
}
*/
