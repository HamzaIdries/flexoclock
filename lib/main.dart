import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/card.dart';

void main() {
  runApp(MyApp());
}

FlexibleTask task1 = FlexibleTask(
  name: "Test",
  difficulty: "Normal",
  tagsList: <String> [
    "Educational",
    "University",
    "Engineering",
    "College"
  ],
  startEnd: TimeWindow(
    start: TimeOfDay.now()
  )
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
