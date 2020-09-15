import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color buttonColor;

  const TextFieldContainer({
    Key key,
    this.child,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}
