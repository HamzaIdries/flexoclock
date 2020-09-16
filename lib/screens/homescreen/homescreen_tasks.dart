import 'package:flexoclock/components/tasks.dart';
import 'package:flexoclock/user_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomescreenTasks {
  List<Task> future;
  Task current;

  UserData userData;

  HomescreenTasks() {
    userData = UserData();
    future = userData.tasksList.getFutureTasks();
    current = userData.tasksList.getCurrentTask();
    if (current == null) {
      final int time = TimeOfDay.now().hour;
      final int bestAtTime = userData.userMatrix.userMatrix[time].getAvg().ceil();
      String difficulty = bestAtTime == 1
      ? 'easy'
          : bestAtTime == 2 ? 'normal' : 'hard';
      bool found = false;
      for (Task task in userData.tasksList.tasksList) {
        if (task.difficulty == difficulty) {
          current = task;
          found = true;
          break;
        }
      }
      if (!found) {
        for (String diff in ['easy', 'normal', 'hard']) {
          for (Task task in userData.tasksList.tasksList) {
            if (task.difficulty == diff) {
              current = task;
              found = true;
              break;
            }
          }
          if (found)
            break;
        }
      }
    }
  }
}