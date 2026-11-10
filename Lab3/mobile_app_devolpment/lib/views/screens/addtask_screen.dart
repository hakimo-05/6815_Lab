import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/reuse/appbar.dart';
import '../../utils/reuse/body_addupdatetask.dart';
import '../../utils/vairables.dart';

class AddtaskScreen extends StatelessWidget {
  const AddtaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      // الشريط العلوي تم اعادة استخدامة مع مراعاة المعايير
      appBar: appBar(thisMyTasks: false, context: context),
      // الشاشة تم اعادة استخدامة مع مراعاة المعايير
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BodyAddupdatetask(titleScreen: titleAddTask, isUpdateTaskScreen: false,),
      ),
    );
  }
}

