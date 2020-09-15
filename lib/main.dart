import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/card.dart';

void main() {
  runApp(MyApp());
}

Task task1 = Task(
  name: "Task 1",
  difficulty: "Hard",
  tags: <String> [
    "Educational",
    "University",
    "Engineering",
    "College",
    "This is an example of a very long tag"
  ],
  start: TimeOfDay.now(),
  hasDeadline: true,
  deadline: DateTime.now()
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
          ],
        ),
      ),
    );
  }
//test
}
