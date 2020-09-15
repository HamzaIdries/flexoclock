import 'package:flexoclock/components/tasks.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flexoclock/screens/login_screen.dart';
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
          body: WelcomeScreen(),
        ),
      );
  }
//test
}
