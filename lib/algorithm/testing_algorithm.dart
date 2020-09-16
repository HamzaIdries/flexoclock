import 'dart:convert';

import 'package:flexoclock/components/login_background.dart';
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

class Testing extends StatelessWidget {
  Algorithm algorithm = Algorithm();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'i want to die'
          ),
        ),
      ),
    );
  }
}
