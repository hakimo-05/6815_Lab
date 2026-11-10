import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      thickness: 1.5,
      endIndent: 1,
    );
  }
}
