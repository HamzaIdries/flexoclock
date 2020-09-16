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
  final bool hasDeadline; // true iff the task has a deadline
  final DateTime deadline;
  // start and end time during the day, pre-determined for fixed tasks,
  // chosen in real time by the user for flexible tasks
  final TimeOfDay start;
  final TimeOfDay finish;

  // repetitions throughout the week, starts from sunday, true if it happens
  // on that day
  final List<bool> repetition;

  final List<String> tags;
  final bool started; // whether the user pressed start or not, auto for fixed
  final bool isCurrent;
  final bool isFuture;
  final bool isPast;
  final bool displayButtons;
  Task({@required this.type, @required this.name, this.started = false,
    this.start, this.finish,
    @required this.tags, this.displayButtons = false,
    this.isCurrent = false, this.isPast = false, this.isFuture = false,
    this.repetition, this.difficulty, this.hasDeadline = false, this.deadline,
  });
}
