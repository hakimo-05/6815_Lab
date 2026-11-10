import 'package:flutter/material.dart';

import '../colors.dart';

class ButtonsAddUpdateDelete extends StatelessWidget {
  const ButtonsAddUpdateDelete({
    super.key,
    required this.isUpdateTaskScreen,
    this.onAddTask, this.onUpdateTask, this.onDeleteTask,
  });

  final bool isUpdateTaskScreen;
  final VoidCallback? onAddTask;
  final VoidCallback? onUpdateTask;
  final VoidCallback? onDeleteTask;

  @override
  Widget build(BuildContext context) {
    //لوضع البطمة في الوسط
    return isUpdateTaskScreen
        ?
          // اعرض هذه الازار
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  //لوضع وظيفة الزر
                  onPressed:onDeleteTask,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cancel_outlined,
                        size: 15,
                        color: mainColor,
                      ),
                      SizedBox(width: 2),
                      const Text(
                        'Delete Task',
                        style: TextStyle(color: mainColor, fontSize: 15),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  //لوضع وظيفة الزر
                  onPressed: onUpdateTask,
                  child: const Text(
                    'Update task',
                    style: TextStyle(color: white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          )
        :
          //  اذا كان في شاشة اضافة مهمه اعرض هذا الزر
          Center(
            child: SizedBox(
              height: 60,
              width: 140,
              child: ElevatedButton(
                //لوضع وظيفة الزر
                onPressed: onAddTask,
                child: const Text(
                  'Add Task',
                  style: TextStyle(color: white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          );
  }
}
