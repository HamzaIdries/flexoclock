import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/text_field.dart';

class TextFieldComponent extends StatelessWidget {
  final Icon icon;
  final String textHint;
  final bool isPass;
  final Color buttonColor;
  final Function onChanged;

  TextFieldComponent({this.icon, this.textHint, this.isPass, this.buttonColor, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      buttonColor: buttonColor,
      child: TextField(
        onChanged: onChanged,
        obscureText: isPass,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          icon: icon,
          hintText: textHint,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
