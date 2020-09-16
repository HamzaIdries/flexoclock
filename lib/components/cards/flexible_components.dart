import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';
import 'package:flexoclock/components/cards/common_components.dart';

Widget flexibleHeader(Task flexibleTask, context) {

  final bool isCurrent =
      flexibleTask.start != null && flexibleTask.finish == null;
  final bool isFuture =
      flexibleTask.start == null && flexibleTask.finish == null;
  final bool isPast =
      flexibleTask.start != null && flexibleTask.finish != null;

  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (isFuture || flexibleTask.hasStarted)
          Text('RECOMMENDED')
        else if (isCurrent)
          Text('CURRENT')
        else
          Text('DONE'),
        DifficultyTag(
          difficulty: flexibleTask.difficulty,
        ),
      ],
    ),
  );
}

Widget displayDeadline(DateTime deadline) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final String date = DateFormat("d/M").format(deadline);
  final finalDate = deadline.isSameDate(today)
      ? 'today'
      : deadline.isSameDate(tomorrow) ? 'tomorrow'
      : 'on $date';
  final String time = '${DateFormat.jm().format(deadline)}';

  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Center(
      child: Text(
        'Due $finalDate at $time',
        style: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  );
}

Widget flexibleTime(TimeOfDay start, TimeOfDay end, context) { // start end times
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (start != null)
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'STARTED: ${start.format(context)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (end != null)
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'FINISHED: ${end.format(context)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget flexibleTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}