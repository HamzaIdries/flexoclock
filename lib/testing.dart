import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Testing());
}

class Testing extends StatelessWidget {
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
}