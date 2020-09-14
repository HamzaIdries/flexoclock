import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.black)
      ),
      onPressed: (){},
      child: Text(
        '#Collage',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      color: Colors.white,
    );
  }
}
