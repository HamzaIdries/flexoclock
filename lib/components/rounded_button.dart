import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final double widthRatio;
  final Color buttonTextColor;

  RoundedButton({this.buttonText, this.onPressed, this.buttonColor, this.widthRatio, this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * widthRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
          color: buttonColor,
          onPressed: onPressed ,
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
