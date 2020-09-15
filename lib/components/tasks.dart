import 'package:flexoclock/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TaskType {
  Fixed,
  Flexible
}

class Task {
  final TaskType type; // flexible or fixed
  final String name;
  final String difficulty;
  final bool hasDeadline;
  final DateTime deadline; // true iff the task has a deadline
  // start and end time during the day, pre-determined for fixed tasks,
  // chosen in real time by the user for flexible tasks
  final TimeOfDay start;
  final TimeOfDay finish;
  // repetitions throughout the week, starts from sunday, true if it happens
  // on that day
  final List<bool> repetition;
  final List<String> tags;

  Task({this.type, this.name, this.difficulty, this.hasDeadline, this.deadline,
    this.start, this.finish, this.repetition, this.tags});
}