import 'package:flutter/material.dart';

import '../colors.dart';

class FieldEnterTitleAndDescribtion extends StatelessWidget {
  const FieldEnterTitleAndDescribtion({
    super.key,
    required this.maxLines,
    required this.minLines, required this.isDescribtion, this.controller,
  });

  final int maxLines;
  final int minLines;
  final bool isDescribtion;
  // استقبال Controller من الشاشة
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 50,
      controller: controller,
      clipBehavior: Clip.antiAlias,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: black),
        ),
        labelText: isDescribtion ? 'Discribe your plan' : '',
        labelStyle: TextStyle(color: grey),
        prefixIcon: isDescribtion ? const Icon(Icons.description_outlined,color: grey,) : null,
      ),
    );
  }
}

