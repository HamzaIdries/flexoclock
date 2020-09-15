import 'package:flexoclock/constants.dart';
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
                child: Image.asset(
                  '${kImagePath}main_welcome.png',
                  height: size.height * 0.5,
                ),
              ),
              Positioned(
                top: size.height * 0.4,
                child: Text(
                  'Welcome to Flexoclock',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
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
                buttonColor: kLoginButtonColor,
                onPressed: () {},
                widthRatio: 0.8,
              ),
              SizedBox(
                height: 8,
              ),
              RoundedButton(
                buttonText: 'Sign Up',
                buttonColor: kSignUpButtonColor,
                onPressed: () {},
                widthRatio: 0.8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
