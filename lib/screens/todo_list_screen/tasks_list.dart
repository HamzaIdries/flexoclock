import 'dart:convert';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

class TasksList {
  List<Task> tasksList;

  TasksList(String jsonInput) {
    tasksList = [];
    List<Map<String, dynamic>> tasksFile = jsonDecode(jsonInput);
    for (Map<String, dynamic> task in tasksFile)
      tasksList.add(
        Task(
          type: task['type'],
          name: task['name'],
          difficulty: task['difficulty'],
          hasDeadline: task['hasDeadline'],
          deadline: task['deadline'],
          start: task['start'],
          finish: task['finish'],
          repetition: List.from(task['repetition']),
          tags: List.from(task['tags']),
          started: task['started'],
          isCurrent: task['isCurrent'],
          isFuture: task['isFuture'],
        ),
      );
  }

  void addTask(Task task) {
    tasksList.add(task); // TODO: make it update the cloud list
  }

  void editTask(Task oldTask, Task newTask) {
    tasksList.remove(oldTask);
    tasksList.add(newTask); // TODO: update
  }

  void removeTask(Task task) {
    tasksList.remove(task);
  }

  List<Task> getFlexibleTasks() {
    List<Task> flexibleTasks = [];
    for (Task task in tasksList) {
      if (task.type == 'Flexible') flexibleTasks.add(task);
    }
    return flexibleTasks;
  }

  List<Task> getFixedTasks() {
    List<Task> fixedTasks = [];
    for (Task task in tasksList) {
      if (task.type == 'Fixed') fixedTasks.add(task);
    }
    return fixedTasks;
  }

  List<Task> getDeadlineTasks() {
    List<Task> deadlineTasks = [];
    for (Task task in tasksList) {
      if (task.hasDeadline) deadlineTasks.add(task);
    }
    return deadlineTasks;
  }

  List<Task> getTasksWithTag(String tag) {
    List<Task> tasksWithTag = [];
    for (Task task in tasksList) {
      if (task.tags.contains(tag)) tasksWithTag.add(task);
    }
    return tasksWithTag;
  }
}
