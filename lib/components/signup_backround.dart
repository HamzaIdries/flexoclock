import 'package:flutter/material.dart';
import 'package:flexoclock/constants.dart';

class SignupBackground extends StatelessWidget {

  final Widget child;

  SignupBackground({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                '${kImagePath}signup_main_bottom_left.png',
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                '${kImagePath}signup_main_top_right.png',
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                '${kImagePath}signup_main_bottom_right.png',
              ),
            ),
            child,
          ],
        ),
      );
  }
}
