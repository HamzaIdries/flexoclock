import 'package:flexoclock/screens/loding_screen.dart';
import 'package:flexoclock/screens/wlecome_screen.dart';
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
      //TODO : add routes to easy navigate
      debugShowCheckedModeBanner: false,
      title: 'Flexoclock',
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}

// ListView(
// children: [
// FlexibleTaskCard(
// taskTitle: 'test',
// ),
// ],
// ),
