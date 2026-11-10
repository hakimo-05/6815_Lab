
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app_devolpment/views/screens/mytask_screen.dart';
import 'utils/lifecycle_observer.dart';
import 'viewmodels/task_viewmodel.dart';

void main() {
  runApp(
    const AppLifecycleObserver(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // توفير TaskViewModel لجميع شاشات التطبيق
    return ChangeNotifierProvider<TaskViewModel>(

      // إنشاء كائن واحد لإدارة المهام
      create: (context) => TaskViewModel(),

      // واجهة التطبيق الرئيسية
      child: MaterialApp(
        title: 'My Tasks',
        debugShowCheckedModeBanner: false,
        home: const MytaskScreen(),
      ),
    );
  }
}
