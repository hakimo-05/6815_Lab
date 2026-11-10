
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app_devolpment/utils/colors.dart';
import 'package:mobile_app_devolpment/viewmodels/task_viewmodel.dart';
import 'package:mobile_app_devolpment/views/screens/updatetask.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({super.key});

  @override
  Widget build(BuildContext context) {

    // الوصول إلى ViewModel والاستماع للتغييرات
    final viewModel = context.watch<TaskViewModel>();

    // جلب قائمة المهام من ViewModel
    final tasks = viewModel.tasks;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      // عرض عدد المهام الموجودة فعليًا
      itemCount: tasks.length,

      itemBuilder: (context, index) {

        // الحصول على بيانات المهمة الحالية
        final task = tasks[index];
        // تنسيق التاريخ
        final date = '${task.date.day}/${task.date.month}/${task.date.year}';
        // تنسيق الوقت
        final time = task.time.format(context);

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),

          // السماح بسحب الكارت لحذف المهمة
          child: Dismissible(

            // معرف فريد لكل مهمة
            key: ValueKey(task.id),

            // السحب من البداية للنهاية
            direction: DismissDirection.startToEnd,

            // حذف المهمة مباشرة عند اكتمال السحب
            onDismissed: (direction) {
              viewModel.deleteTask(task.id);
            },

            // الخلفية التي تظهر عند السحب
            background: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Delete this Task',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),

            // تصميم الكارت الأصلي
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),

              child: GestureDetector(

                // الانتقال إلى شاشة تعديل المهمة
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Updatetask(task: task,),
                    ),
                  );
                },
                // كرت المهمه بالكامل
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: task.isCompleted? compleateTaskColor : white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(12),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // دائرة تحديد اكتمال المهمة
                        GestureDetector(
                          onTap: () {

                            // تغيير حالة المهمة من مكتملة
                            // إلى غير مكتملة أو العكس
                            viewModel.toggleTaskCompletion(task.id);
                          },

                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: task.isCompleted
                                  ? mainColor
                                  : white,
                              border:task.isCompleted
                                  ? null :
                                   Border.all(
                                color: Colors.grey.shade400,
                                width: 2,
                              ) ,
                            ),

                            // ظهور علامة صح عند إكمال المهمة
                            child: task.isCompleted
                                ? const Icon(
                              Icons.check,
                              color: white,
                            )
                                : null,
                          ),
                        ),

                        const SizedBox(width: 15),

                        // عرض عنوان المهمة ووصفها
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                task.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color:  black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                task.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:  TextStyle(
                                  fontSize: 15,
                                  color: task.isCompleted
                                      ? black
                                      : grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // عرض التاريخ والوقت
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 15,
                                color: task.isCompleted
                                    ? white
                                    : grey,
                              ),
                            ),

                            Text(
                              date,
                              style:  TextStyle(
                                fontSize: 15,
                                color: task.isCompleted
                                    ? white
                                    : grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


/*
import 'package:flutter/material.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/vairables.dart';
import '../../screens/updatetask.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              // يسمح لي بانشاء حاوية يمكنك ان تضع معلومات المهمه بداخلها
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Updatetask()));},
                // تسمحلك تمرر الكرت عشن نحذفوه
                child: Dismissible(
                  key: Key(key.toString()),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                   height: 120,
                    width: double.infinity ,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(Icons.delete,color: Colors.red,),
                        ),
                        const Text('Delete this Task', style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                  //  الكرت بالكامل
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      //يجعل ال widget تصطف افقيا
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // استحدمناه ك حاوية على شكل دائرة لوضع علامة عند اكتمالها
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                              border: Border.all(color: Colors.grey.shade400,width: 2),
                            ),
                          ),
                          SizedBox(width: 15,),
                          // عمواد لوضع العنوان و الوصف داخل الكرت
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(titleTask,style: TextStyle(fontSize: 20,color: black,fontWeight: FontWeight.bold),),
                              Text(subTitleTask,style: TextStyle(fontSize: 15,color: grey,),),
                            ],
                          ),
                          // تعطي المسافة لاقصى مساحة ممكنة
                          Spacer(),
                          // عمود لوضع التاريخ و الوقت
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("12:00 AM",style: TextStyle(fontSize: 15,color: grey,),),
                              Text('21/03/2005',style: TextStyle(fontSize: 15,color: grey,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/vairables.dart';
import '../../screens/updatetask.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              // يسمح لي بانشاء حاوية يمكنك ان تضع معلومات المهمه بداخلها
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Updatetask()));},
                // تسمحلك تمرر الكرت عشن نحذفوه
                child: Dismissible(
                  key: Key(key.toString()),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                   height: 120,
                    width: double.infinity ,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(Icons.delete,color: Colors.red,),
                        ),
                        const Text('Delete this Task', style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                  //  الكرت بالكامل
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      //يجعل ال widget تصطف افقيا
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // استحدمناه ك حاوية على شكل دائرة لوضع علامة عند اكتمالها
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                              border: Border.all(color: Colors.grey.shade400,width: 2),
                            ),
                          ),
                          SizedBox(width: 15,),
                          // عمواد لوضع العنوان و الوصف داخل الكرت
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(titleTask,style: TextStyle(fontSize: 20,color: black,fontWeight: FontWeight.bold),),
                              Text(subTitleTask,style: TextStyle(fontSize: 15,color: grey,),),
                            ],
                          ),
                          // تعطي المسافة لاقصى مساحة ممكنة
                          Spacer(),
                          // عمود لوضع التاريخ و الوقت
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("12:00 AM",style: TextStyle(fontSize: 15,color: grey,),),
                              Text('21/03/2005',style: TextStyle(fontSize: 15,color: grey,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
*/
