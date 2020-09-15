import 'package:flexoclock/components/login_background.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/text_field.dart';
import 'package:flexoclock/components/text_field_comp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextFieldComponent(
              textHint: 'Enter your email',
              isPass: false,
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFieldComponent(
              textHint: 'Enter your password',
              isPass: true,
              icon: Icon(
                FontAwesomeIcons.key,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

