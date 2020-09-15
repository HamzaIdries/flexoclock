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
                  onPressed: (){}, // TODO: implement the done press
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
              ),
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
                  onPressed: (){}, // TODO: implement the postpone press
                  child: Text(
                    'Postpone',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month
        && this.day == other.day;
  }
}

Widget flexibleVerticalPadding() {
  return SizedBox(
    height: kFlexibleVerticalPadding,
  );
}

Widget flexibleHeader(Task flexibleTask, bool isCurrent, bool isFuture, bool isPast, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      if (isFuture)
        Text('RECOMMENDED')
      else if (isCurrent)
        Text('CURRENT') // TODO: implement the design idea
      else
        Row(
          children: <Widget>[
            Text(flexibleTask.start.format(context)),
            Text('-----------------------'), // TODO: change into line
            Text(flexibleTask.finish.format(context)),
          ],
        ),
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
  final String date =  '${deadline.day.toString()}/${deadline.month.toString()}';
  print(today);
  final finalDate = deadline.isSameDate(today) ? 'today' : deadline.isSameDate(tomorrow) ? 'tomorrow' : 'on $date';
  final fixedHour = (deadline.hour - (deadline.hour > 12 ? 12 : 0)).toString();
  final String time =  '${deadline.hour}:${deadline.minute}';
  return Column(
    children: <Widget>[
      flexibleVerticalPadding(),
      Text(
        'Due $finalDate at $time',
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

    final bool isCurrent = flexibleTask.start != null && flexibleTask.finish == null;
    final bool isFuture = flexibleTask.start == null && flexibleTask.finish == null;
    final bool isPast = flexibleTask.start != null && flexibleTask.finish != null;

    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: size.width * kFlexibleWidth,
          //height: kFlexibleHeight, //TODO: make height constant or not?
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              flexibleHeader(flexibleTask, isCurrent, isFuture, isPast, context),
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
              Container(
                height: kTagsHeight,
                //width: size.width - 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (String tag in flexibleTask.tags) Tag(tagText: tag,)
                  ], //TODO: list view builder?
                ),
              ),
              if (isCurrent)
                CurrentTaskChoices(),
              if(flexibleTask.hasDeadline != null)
                displayDeadline(flexibleTask.deadline)
            ],
          ),
        ),
      ),
    );
  }
}