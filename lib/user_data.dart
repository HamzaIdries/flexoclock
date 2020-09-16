import 'dart:convert';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flexoclock/screens/todo_list_screen/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';
import 'package:flexoclock/components/storage.dart';
import 'dart:io' as io;

class WeekAvg {
  String toString() {
    return week.toString();
  }

  double getAvg() {
    int sum = 0;
    for (int i in week) sum += i;
    return (sum * 1.0) / 7;
  }

  List<int> week;
  WeekAvg(List<int> week) {
    this.week = List.from(week);
  }

  static WeekAvg newWeekAvg() {
    return WeekAvg([0, 0, 0, 0, 0, 0, 0]);
  }

  void addDay(int day) {
    int counter = 0;
    for (int i = 0; i < 7; i++) {
      if (week[i] == 0)
        break;
      else
        counter++;
    }
    if (counter < 7)
      week[counter] = day;
    else {
      for (int i = 0; i < 6; i++) {
        week[i] = week[i + 1];
      }
      week[6] = day;
    }
  }
}

class UserMatrix {
  List<WeekAvg> userMatrix;

  void resetMatrix() {
    this.userMatrix = [];
    for (int i = 0; i < 24; i++) userMatrix.add(WeekAvg.newWeekAvg());
  }

  @override
  String toString() {
    return userMatrix.toString();
  }

  String toEncodable() {
    return this.toString();
  }

  UserMatrix() {
    resetMatrix();
  }

  void setEqualTo(UserMatrix other) {
    for (int i = 0; i < 24; i++) {
      this.userMatrix[i].week = List.from(other.userMatrix[i].week);
    }
  }
}

class DayData {
  Map<String, dynamic> dayData;
  DayData() {
    readFromFile();
  }

  DayData.newDay() {
    dayData = {};
    dayData['dayOfWeek'] = DateTime.now().weekday.toString();
    dayData['time'] = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ];
  }

  void parseString(String fileContent) {
    Map<String, dynamic> jsonRes = jsonDecode(fileContent);
    dayData['dayOfWeek'] = jsonRes['dayOfWeek'];
    dayData['time'] = jsonRes['time'];
  }

  void readFromFile() async {
    final Storage storage = Storage('day_data');
    storage.readData().then((String value) {
      parseString(value);
    });
  }

  void writeToFile() async {
    final Storage storage = Storage('day_data');
    storage.writeData(jsonEncode(dayData));
  }
}

class UserData {
  Map<String, dynamic> userData = {
    'userName': 'User Name',
    'User Matrix': UserMatrix().toString(),
    'tasksList': <String>[],
  };

  int getDifficulty(int time) {
    return  (this.userMatrix.userMatrix[time].getAvg()).ceil();
  }

  String userName;
  UserMatrix userMatrix;
  TasksList tasksList;

  UserData() {
    userMatrix = UserMatrix();
    readFromFile();
    print('FFFFFF${tasksList.toString()}');
  }

  UserData.newUser() {
    userData = {};
    this.userName = 'New User';
    userData['userName'] = 'New User';
    this.userMatrix = UserMatrix();
    userData['userMatrix'] = UserMatrix().toString();
    this.tasksList = TasksList.emptyList();
    userData['tasksList'] = '[]';
  }

  void parseString(String fileContent) {
    Map<String, dynamic> jsonRes = jsonDecode(fileContent);
    this.userName = jsonRes['userName'];
    userData['userName'] = jsonRes['userName'];
    this.userMatrix.setEqualTo(jsonRes['userMatrix']);
    userData['userMatrix'] = jsonRes['userMatrix'].toString();
    this.tasksList.copy(jsonRes['tasksList']);
    userData['tasksList'] = jsonRes['tasksList'].toString();
    if (this.tasksList == null)
      this.tasksList.copy(TasksList.emptyList());
  }

  void readFromFile() async {
    final Storage storage = Storage('user_data');
    storage.readData().then((String value) {
      parseString(value);
    });
  }

  void writeToFile() async {
    final Storage storage = Storage('user_data');
    storage.writeData(jsonEncode(userData));
  }

  String toString() {
    return jsonEncode(this.userData);
  }
}

void createFiles() {
  DayData dayData = DayData.newDay();
  UserData userData = UserData.newUser();
  dayData.writeToFile();
  userData.writeToFile();
}
