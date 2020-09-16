import 'dart:convert';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TasksList {
  List<Task> tasksList;

  String toString() {
    String res = '';
    for (Task task in tasksList)
      res += task.toEncodable();
    return res;
  }

  String toEncodable() {
    return this.toString();
  }

  TasksList.emptyList() {
    tasksList = [];
  }

  static TasksList tasksListWithJust(Task task) {
    TasksList res = TasksList.emptyList();
    res.addTask(task);
    return res;
  }

  void copy(TasksList other) {
    tasksList = List.from(other.tasksList);
  }

  TasksList(List<Map<String, dynamic>> tasksFile) {
    tasksList = [];
    for (Map<String, dynamic> task in tasksFile) {
      tasksList.add(
        Task(
          type: task['type'],
          name: task['name'],
          difficulty: task['difficulty'],
          hasDeadline: task['hasDeadline'],
          deadline: task['deadline'],
          start: task['start'],
          end: task['finish'],
          repetition: List.from(task['repetition']),
          tags: List.from(task['tags']),
          started: task['started'],
          isCurrent: task['isCurrent'],
          isFuture: task['isFuture'],
        ),
      );
    }
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
    if (tasksList == null)
      return <Task>[];
    List<Task> flexibleTasks = [];
    for (Task task in tasksList) {
      if (task.type == 'Flexible') flexibleTasks.add(task);
    }
    return flexibleTasks;
  }

  List<Task> getFixedTasks() {
    if (tasksList == null)
      return <Task>[];
    List<Task> fixedTasks = [];
    for (Task task in tasksList) {
      if (task.type == 'Fixed') fixedTasks.add(task);
    }
    return fixedTasks;
  }

  List<Task> getDeadlineTasks() {
    if (tasksList == null)
      return <Task>[];
    List<Task> deadlineTasks = [];
    for (Task task in tasksList) {
      if (task.hasDeadline) deadlineTasks.add(task);
    }
    return deadlineTasks;
  }

  List<Task> getTasksWithTag(String tag) {
    if (tasksList == null)
      return <Task>[];
    List<Task> tasksWithTag = [];
    for (Task task in tasksList) {
      if (task.tags.contains(tag)) tasksWithTag.add(task);
    }
    return tasksWithTag;
  }

  Task getCurrentTask() {
    if (tasksList == null)
      return null;
    for (Task task in tasksList) {
      final currentTime = DateTime.now();
      final start = DateTime(currentTime.year, currentTime.month,
          currentTime.day, task.start.hour, task.start.minute);
      final end = DateTime(currentTime.year, currentTime.month,
          currentTime.day, task.end.hour, task.end.minute);
      if (currentTime.isAfter(start) && currentTime.isBefore(end)) {
        return task;
        break;
      }
    }
    return null;
  }

  List<Task> getFutureTasks() {
    if (tasksList == null)
      return <Task>[];
    List<Task> res = [];
    for (Task task in tasksList) {
      final currentTime = DateTime.now();
      final end = DateTime(currentTime.year, currentTime.month,
          currentTime.day, task.end.hour, task.end.minute);
      if (currentTime.isAfter(end))
        res.add(task);
    }
    return res;
  }
}