import 'dart:convert';
import 'package:flexoclock/components/login_background.dart';
import 'package:flexoclock/components/storage.dart';
import 'package:flexoclock/screens/home_screen.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/profile_screen.dart';
import 'package:flexoclock/screens/signup_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flexoclock/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/text_field.dart';
import 'package:flexoclock/components/text_field_comp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flexoclock/components/rounded_button.dart';
import 'package:flexoclock/algorithm/algorithm.dart';

void main() {
  runApp(Testing());
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  Algorithm algorithm = Algorithm();

  Storage storage = Storage('user_data');

  String s;

  @override
  Widget build(BuildContext context) {
    storage.readData().then((value) => {
      s = value
    });
    createFiles();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$s'
          ),
        ),
      ),
    );
  }
}
