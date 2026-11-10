import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class  Task {
  final String id;
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.isCompleted=false,
  });

  factory Task.create({
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    bool isCompleted=false,
  })=> Task(
    id: const Uuid().v1(),
    title: title ?? '',
    description: description ?? '',
    date: date ?? DateTime.now(),
    time: time ?? TimeOfDay.now(),
    isCompleted: isCompleted,
  );
}


