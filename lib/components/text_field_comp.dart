import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flexoclock/components/text_field.dart';

class TextFieldComponent extends StatelessWidget {
  final Icon icon;
  final String textHint;
  final bool isPass;

  TextFieldComponent({this.icon, this.textHint, this.isPass});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
