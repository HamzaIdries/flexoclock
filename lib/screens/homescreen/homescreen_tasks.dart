import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

class HomescreenTasks {
  List<Task> past;
  List<Task> future;
  Task current;

  HomescreenTasks({this.past, this.current, this.future});
}