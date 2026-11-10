import 'package:flutter/material.dart';
import '../../models/task.dart';

import '../../utils/colors.dart';
import '../../utils/reuse/appbar.dart';
import '../../utils/reuse/body_addupdatetask.dart';
import '../../utils/vairables.dart';

class  Updatetask extends StatelessWidget {
  const  Updatetask({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: appBar(context: context, thisMyTasks: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BodyAddupdatetask(titleScreen:titleUpdateTask, isUpdateTaskScreen: true, task: task,),
      ),
    );
  }
}

