import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              '${kImagePath}main_welcome.png',
              height: size.height * 0.5,
            ),
          ),
          Positioned(
            top: size.height * 0.5,
            child: Text(
              'Welcome to Flexoclock',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
