import 'package:flexoclock/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  final String type; // flexible or fixed
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
  final bool displayButtons;
  Task(
      {
        @required this.type,
        @required this.name,
        this.started = false,
        this.start, // required for fixed
        this.finish, // required for fixed
        @required this.tags,
        this.displayButtons = false,
        this.isCurrent = false, // one of isCurrent or isFuture is required
        this.isFuture = false,
        this.repetition, // required for fixed
        this.difficulty, // required for flexible
        this.hasDeadline = false, // required for flexible
        this.deadline, // required if hasDeadline == true
      }
  );
}
