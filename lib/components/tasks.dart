import 'dart:convert';

import 'package:flexoclock/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  Map<String, dynamic> task =
  {
    'type': 'flexible',
    'name': 'Task Name',
    'difficulty': 'normal',
    'hasDeadline': false,
    'deadline': DateTime.now().toString(),
    'start': TimeOfDay.now().toString(),
    'end': TimeOfDay.now().toString(),
    'repetition': [true, true, true, true, true, false, false],
    'tags': <String>[],
    'started': false,
    'isCurrent': false,
    'isFuture': false,
    'displayButtons': false
  };
  final String type; // flexible or fixed
  final String name;
  final String difficulty;
  final bool hasDeadline; // true iff the task has a deadline
  final DateTime deadline;
  // start and end time during the day, pre-determined for fixed tasks,
  // chosen in real time by the user for flexible tasks
  final TimeOfDay start;
  final TimeOfDay end;

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
        this.end, // required for fixed
        @required this.tags,
        this.displayButtons = false,
        this.isCurrent = false, // one of isCurrent or isFuture is required
        this.isFuture = false,
        this.repetition, // required for fixed
        this.difficulty, // required for flexible
        this.hasDeadline = false, // required for flexible
        this.deadline, // required if hasDeadline == true
      }
  ) {
    task['type'] = type;
    task['name'] = name;
    task['started'] = started;
    task['start'] = start.toString();
    task['end'] = end.toString();
    task['tags'] = tags.toString();
    task['displayButtons'] = displayButtons;
    task['isCurrent'] = isCurrent;
    task['isFuture'] = isFuture;
    task['repetition'] = repetition.toString();
    task['difficulty'] = difficulty;
    task['hasDeadline'] = hasDeadline;
    task['deadline'] = deadline.toString();
  }

  String toEncodable() {
    return jsonEncode(this);
  }
}
