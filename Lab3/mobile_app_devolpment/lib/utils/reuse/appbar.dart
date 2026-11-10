

import 'package:flutter/material.dart';
import '../colors.dart';
import '../vairables.dart';

PreferredSizeWidget appBar({
  required BuildContext context,
  required bool thisMyTasks,
  VoidCallback? onDeleteAllConfirmed,
}) {
  return AppBar(
    backgroundColor: white,
    elevation: 0.0,
    title: thisMyTasks
        ? Text(
      titleMyTask,
      style: TextStyle(
        fontSize: 35,
        color: black,
        fontWeight: FontWeight.bold,
      ),
    ) : const Text(''),
    actions: [
      if (thisMyTasks)
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Image.asset(
              'lib/utils/images/garbge.png',
              width: 40,
              height: 50,
            ),
            // عند الضغط على سلة المهملات
            onPressed:() async {
              // عرض نافذة تأكيد حذف جميع المهام
              final bool? result = await showDialog<bool>(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text('Delete All Tasks'),
                  content: const Text(
                    'Are you sure you want to delete all tasks?',
                  ),
                  actions: [
                    // إلغاء الحذف
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext, false);
                      },
                      child: const Text('Cancel'),
                    ),
                    // تأكيد الحذف
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext, true);
                      },
                      child: const Text(
                        'Delete All',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              // استدعاء وظيفة الحذف عند تأكيد المستخدم
              // سيتم ربطها بالـ ViewModel لاحقًا
              if (result == true && context.mounted) {
                onDeleteAllConfirmed?.call();
              }
            }
          ),
        ),
    ],

    leading: thisMyTasks
        ? null
        : Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 50,
        ),
      ),
    ),
  );
}


// import 'package:flutter/material.dart';
//
// import '../colors.dart';
// import '../vairables.dart';
//
// PreferredSizeWidget appBar({required BuildContext context,required bool thisMyTasks}){
//   return AppBar(
//     backgroundColor: white,
//     elevation: 0.0,
//     title: thisMyTasks? Text(titleMyTask,style: TextStyle(fontSize: 35, color: black,fontWeight: FontWeight.bold),) : const Text(""),
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child:thisMyTasks? Image.asset('lib/utils/images/garbge.png',width: 40,height: 50,) : Container(),
//       ),
//     ],
//     leading: thisMyTasks? Container() : Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: GestureDetector(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,size: 50,),),
//     ),
//   );
// }
