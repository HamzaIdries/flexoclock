import 'package:flexoclock/components/signup_backround.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/constants.dart';
import 'package:flexoclock/components/rounded_button.dart';
import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/text_field_comp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String _userName, _email, _password;

    return Scaffold(
      body: SignupBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
                'Sign up',
                style: kMainScreenStyle,
              ),
            SizedBox(
              height: 16.0,
            ),
            TextFieldComponent(
              onChanged: (value) {
                _userName = value;
              },
              buttonColor: kLoginScreenButtonColor,
              textHint: 'Enter your user name',
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
              onChanged: (value) {
                _email = value;
              },
              buttonColor: kLoginScreenButtonColor,
              textHint: 'Enter your email',
              isPass: false,
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFieldComponent(
              onChanged: (value) {
                _password = value;
              },
              buttonColor: kLoginScreenButtonColor,
              textHint: 'Enter your password',
              isPass: true,
              icon: Icon(
                FontAwesomeIcons.key,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Hero(
              tag: 'signup',
              child: RoundedButton(
                buttonTextColor: Colors.white,
                buttonColor: kSubmitLoginScreenButtonColor,
                buttonText: 'Sign up',
                widthRatio: 0.4,
                onPressed: () {
                  print(_email);
                  print(_password);
                  print(_userName);
                },
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'login',
                    style: TextStyle(
                      color: kLoginScreenButtonColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//TODO : check valid email and add keyboard shortcut