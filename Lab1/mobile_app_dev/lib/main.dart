import 'package:flutter/material.dart';

import 'home_screen.dart';

//
class LifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint(
      '[Lifecycle] ${DateTime.now()} - ${state.name}',
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final lifecycleObserver = LifecycleObserver();
  WidgetsBinding.instance.addObserver(lifecycleObserver);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login screen',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}


