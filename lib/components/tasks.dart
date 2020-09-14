import 'package:flexoclock/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeWindow { // Represents a time duration during a day
  TimeWindow({this.start, this.end});

  final TimeOfDay start;
  final TimeOfDay end;
}

class FixedTask {
  // TODO: Parsing JSON from API
  FixedTask({@required this.name, @required this.duration,
    @required this.repetition, @required this.tagsList, this.endDate});

  final String name;
  final TimeWindow duration;
  final List<bool> repetition; // Starts from Sun, 0 if no; 1 otherwise
  final List<Tag> tagsList;
  final DateTime endDate;
}

class FlexibleTask {
  // TODO: Mix classes into one?
  FlexibleTask({@required this.name, @required this.difficulty, @required this.tagsList});

  final String name;
  final String difficulty;
  final List<Tag> tagsList;
}