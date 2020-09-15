import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';

class CurrentTaskChoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        flexibleVerticalPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ButtonTheme(
              height: 50,
              minWidth: 150,
              child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: BorderSide(color: Colors.black),
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
              child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: BorderSide(color: Colors.red),
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
      ],
    );
  }
}

Widget tagsList(List<String> tags) {
  return Container(
    height: kTagsHeight,
    //width: size.width - 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for (String tag in tags)
          Tag(
            tagText: tag,
          )
      ],
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

Widget flexibleVerticalPadding() {
  return SizedBox(
    height: kFlexibleVerticalPadding,
  );
}

Widget flexibleHeader(
    Task flexibleTask, bool isCurrent, bool isFuture, bool isPast, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      if (isFuture)
        Text('RECOMMENDED')
      else if (isCurrent)
        Text('CURRENT')
      else
        Text('DONE'),
      Align(
        alignment: Alignment.topRight,
        child: DifficultyTag(
          difficulty: flexibleTask.difficulty,
        ),
      ),
    ],
  );
}

Widget displayDeadline(DateTime deadline) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final String date = '${deadline.day.toString()}/${deadline.month.toString()}';
  print(today);
  final finalDate = deadline.isSameDate(today)
      ? 'today'
      : deadline.isSameDate(tomorrow) ? 'tomorrow' : 'on $date';
  final fixedHour = (deadline.hour - (deadline.hour > 12 ? 12 : 0)).toString();
  final String time =
      '${deadline.hour}:${deadline.minute < 10 ? '0${deadline.minute}' : deadline.minute}';
  return Column(
    children: <Widget>[
      flexibleVerticalPadding(),
      Text(
        'Due $finalDate at $time',
      ),
    ],
  );
}

Widget flexibleTime(TimeOfDay start, TimeOfDay end, context) {
  return Column(
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
  );
}

class FlexibleTaskCard extends StatelessWidget {
  final Task flexibleTask;

  FlexibleTaskCard(this.flexibleTask);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final bool isCurrent =
        flexibleTask.start != null && flexibleTask.finish == null;
    final bool isFuture =
        flexibleTask.start == null && flexibleTask.finish == null;
    final bool isPast =
        flexibleTask.start != null && flexibleTask.finish != null;

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: size.width * kFlexibleWidth,
          //height: kFlexibleHeight, //TODO: make height constant or not?
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              flexibleHeader(
                  flexibleTask, isCurrent, isFuture, isPast, context),
              flexibleTime(flexibleTask.start, flexibleTask.finish, context),
              flexibleVerticalPadding(),
              Text(
                flexibleTask.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              flexibleVerticalPadding(),
              tagsList(flexibleTask.tags),
              if (isCurrent) CurrentTaskChoices(),
              if (flexibleTask.hasDeadline != null)
                displayDeadline(flexibleTask.deadline),
            ],
          ),
        ),
      ),
    );
  }
}

class FixedTask extends StatelessWidget {
  final Task fixedTask;

  FixedTask(this.fixedTask);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: kFixedCardBG, //TODO: get color from Khaled
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.fixedTask.start.format(context),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  this.fixedTask.start.format(context),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Text(
                  fixedTask.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
