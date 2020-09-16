import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';

Widget startTask(Color color, bool includeReplace) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      ButtonTheme(
        height: 50,
        minWidth: 150,
        child: OutlineButton(
            borderSide: BorderSide(color: color,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            onPressed: () {}, // TODO: implement the done press
            child: Text(
              'Start',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color,
              ),
            )),
      ),
      if (includeReplace)
        ButtonTheme(
          height: 50,
          minWidth: 150,
          child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
                side: BorderSide(color: Colors.orange),
              ),
              onPressed: () {}, // TODO: implement the postpone press
              child: Text(
                'Replace',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.orange,
                ),
              )),
        ),
    ],
  );
}

Widget currentTaskChoices() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButtonTheme(
          height: 50,
          minWidth: 150,
          child: OutlineButton(
            borderSide: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              onPressed: () {}, // TODO: implement the done press
              child: Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              )),
        ),
        ButtonTheme(
          height: 50,
          minWidth: 150,
          child: OutlineButton(
            borderSide: BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              onPressed: () {}, // TODO: implement the postpone press
              child: Text(
                'Postpone',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.red,
                ),
              )),
        ),
      ],
    ),
  );
}

Widget tagsList(List<String> tags, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Container(
      height: kTagsHeight,
      //width: size.width - 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (String tag_ in tags)
            tag(tag_, color)
        ],
      ),
    ),
  );
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}