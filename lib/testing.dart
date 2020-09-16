import 'package:flexoclock/components/login_background.dart';
import 'package:flexoclock/screens/home_screen.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/main_homescreen.dart';
import 'package:flexoclock/screens/profile_screen.dart';
import 'package:flexoclock/screens/semi_home_screen.dart';
import 'package:flexoclock/screens/signup_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/text_field.dart';
import 'package:flexoclock/components/text_field_comp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:flexoclock/components/rounded_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(Testing());
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexoclock',
      home: WelcomeScreen(),
      );
  }
}
