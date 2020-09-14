import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexoclock',
      home: Scaffold(
        body: ListView(
          children: [
            FlexibleTaskCard(
              taskTitle: 'test',
            ),
          ],
        ),
      ),
    );
  }
//test
}
