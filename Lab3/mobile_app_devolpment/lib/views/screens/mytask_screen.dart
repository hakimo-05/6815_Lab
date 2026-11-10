import 'package:flutter/material.dart';
import '../widgets/mytaskswidgets/listtasks.dart';
import '../../utils/colors.dart';
import '../../utils/reuse/appbar.dart';
import '../../utils/vairables.dart';
import 'addtask_screen.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_devolpment/viewmodels/task_viewmodel.dart';

class  MytaskScreen extends StatelessWidget {
  const  MytaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تجعل الشاشة تقسم لاجزاء مثل الشريط العلوي و باقي الشاشة
    return Scaffold(
      // توفر زر لاضافة مهمة جديدة
      floatingActionButton: GestureDetector(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddtaskScreen()));},
        child: Material(
          elevation: 4.5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius:BorderRadius.circular(15),
            ),
            child: const Icon(Icons.add,color: white,size: 60,),
          ),
        ),
      ),
      backgroundColor: white,
      // الشريط العلوي تم استدعائه
      appBar: appBar(
      context: context,
      thisMyTasks: true,
      // تنفذ هذه الدالة عند تأكيد حذف جميع المهام
      onDeleteAllConfirmed: () {
        context.read<TaskViewModel>().deleteAllTasks();
      },
    ),

    // تجعل الشاشة يمكن تمريرها
      body: SingleChildScrollView(
        // يدير التحكم في المسافات
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          // يجعل ال widget تصطف عموديا
          child: Column(
            children: [
              // تنشئ خط مثل الذي اسفل My Tasks
              Divider(color: black,endIndent: 1,),
              // يضع مسافة راسية
              SizedBox(height: 21,),
              // هذا استدعاء لقائمة الكروت

              ListTasks(),
            ],
          ),
        ),
      ),
    );
  }
}

