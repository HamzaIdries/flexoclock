import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/card.dart';

void main() {
  runApp(MyApp());
}

Task task1 = Task(
  name: "Why do you always do that to me i want to watch minecraft T_T",
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
  //finish: TimeOfDay(hour: 23, minute: 5),
  hasDeadline: true,
  deadline: DateTime.now(),
  repetition: <bool>[true, false, true, false, true, false, true],
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
            FixedTask(task1),
          ],
        ),
      ),
    );
  }
//test
}
