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
            Image.asset("assets/images/summit03.png"),
            SizedBox(
              child: ,
              height: 10,
            ),
            FlexibleTaskCard(
              taskTitle: '',
            ),
          ],
        ),
      ),
    );
  }
//test
}
