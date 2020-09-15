import 'package:flexoclock/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TaskType {
  Fixed,
  Flexible
}

class Task {
  final TaskType type;
  final String name;
  final String difficulty;
  final bool hasDeadline;
  final DateTime deadline;
  final TimeOfDay start;
  final TimeOfDay finish;
  final List<bool> repetition;
  final List<String> tags;

  Task({this.type, this.name, this.difficulty, this.hasDeadline, this.deadline,
    this.start, this.finish, this.repetition, this.tags});
}