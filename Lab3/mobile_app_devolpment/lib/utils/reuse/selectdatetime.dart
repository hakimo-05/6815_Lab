import 'package:flutter/material.dart';

import '../colors.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({
    super.key,
    required this.titleDateOrTime,
    required this.ValueDateOrTime,
    required this.onTap,
  });

  final String titleDateOrTime;
  final String ValueDateOrTime;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        // لترتيب العناصر في كرت التاريخ و الوقت
        child: Row(
          children: [
            Text(titleDateOrTime, style: TextStyle(color: grey)),
            Spacer(),
            // حاوية رمادية وضعنا بها التاريخ و الوقت
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(ValueDateOrTime, style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
