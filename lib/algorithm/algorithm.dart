import 'dart:convert';
import 'package:flexoclock/components/cards/common_components.dart';
import 'package:flexoclock/components/storage.dart';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flexoclock/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

class Algorithm {
  UserData userData;
  DayData dayData;

  bool test;

  void updateUserData() async {
    for (int i = 0; i < 24; i++) {
      userData.userMatrix.userMatrix[i].addDay(dayData.dayData['time'][i]);
    }
  }

  Algorithm() {
    userData = UserData();
    dayData = DayData();
    if (DateTime.now().hour == 23 && DateTime.now().minute == 59) {
      updateUserData();
      dayData = DayData.newDay();
    }
  }
}