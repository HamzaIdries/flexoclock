import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Transform.scale(
                  scale: 0.5,
                  child: Image.asset(
                    '${kImagePath}logo.png',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(
                buttonText: 'Log In',
                buttonColor: kWelcomeScreenLoginButtonColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                widthRatio: 0.8,
                buttonTextColor: kWelcomeScreenSignUpButtonColor,
              ),
              SizedBox(
                height: 8,
              ),
              RoundedButton(
                buttonText: 'Sign Up',
                buttonColor: kWelcomeScreenSignUpButtonColor,
                onPressed: () {},
                widthRatio: 0.8,
                buttonTextColor: kWelcomeScreenLoginButtonColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
