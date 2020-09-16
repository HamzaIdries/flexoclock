import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';
import 'package:flexoclock/components/cards/common_components.dart';

Widget dayCircle(String day, bool active) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: active ? Colors.white : kFixedCardBG,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(
          '$day',
          style: TextStyle(
            color: active ? kFixedCardBG : Colors.white,
          ),
        ),
      ),
    ),
  );
}

Row displayRepetition(List<bool> repetition) {
  List<Widget> res = [];
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  for (int i = 0; i < repetition.length; i++)
    res.add(dayCircle(days[i], repetition[i]));
  return Row(
    children: res,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  );
}

Widget fixedTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}