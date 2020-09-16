import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

void main() {
  runApp(MyApp());
}

Task task1 = Task(
  type: TaskType.Flexible,
  name: "Finishing up and continued working for the competition",
  difficulty: "Hard",
  tags: <String> [
    "Educational",
    "University",
    "Engineering",
    "College",
    "This is an example of a very long tag"
  ],
  start: TimeOfDay.now(),
  hasStarted: true,
  hasFinished: false,
  //finish: TimeOfDay(hour: 23, minute: 5),
  hasDeadline: true,
  deadline: DateTime.now().add(Duration(days: 5)),
  repetition: <bool>[true, false, true, false, true, false, true],
  isCurrent: true,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexoclock',
      home: Scaffold(
        body: ListView(
          children: [
            FlexibleTaskCard(task1),
            //FixedTaskCard(task1),
          ],
        ),
      ),
    );
  }
//test
}
