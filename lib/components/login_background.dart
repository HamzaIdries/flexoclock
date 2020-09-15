import 'package:flutter/material.dart';
import 'package:flexoclock/constants.dart';

class LoginBackground extends StatelessWidget {

  final Widget child;

  LoginBackground({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('${kImagePath}main_top_left.png',),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('${kImagePath}main_top_right.png',
            ),
          ),
          Positioned(
            top: size.height * 0.5,
            child: Image.asset('${kImagePath}main_middle_left.png',),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('${kImagePath}main_bottom_right.png',),
          ),
          child,
        ],
      ),
    );
  }
}
