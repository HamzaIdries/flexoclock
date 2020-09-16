import 'package:flexoclock/components/login_background.dart';
import 'package:flexoclock/components/rounded_button.dart';
import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/main_homescreen.dart';
import 'package:flexoclock/screens/signup_screen.dart';
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
    String _email;
    String _password;

    return Scaffold(
      body: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login',
              style: kMainScreenStyle,
              ),
            SizedBox(
              height: 16.0,
            ),
            TextFieldComponent(
              type: TextInputType.emailAddress,
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
              type: TextInputType.visiblePassword,
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
              tag: 'login',
              child: RoundedButton(
                buttonTextColor: Colors.white,
                buttonColor: kSubmitLoginScreenButtonColor,
                buttonText: 'Login',
                widthRatio: 0.5,
                onPressed: () {
                  // print(_email);
                  // print(_password);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MainHomeScreen()));
                },
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('If you don\'t have an account, '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    'sign up',
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
