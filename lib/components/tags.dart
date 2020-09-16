import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

String checkCharLimit(String tagText, int charLimit) {
  if (tagText.length > charLimit)
    return tagText.substring(0, charLimit - 3) + "...";
  else
    return tagText;
}

Widget tag(String tagText, Color color) {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 8.0,
      ),
      OutlineButton(
        //color: color,
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: ()=>{},
        child: Text(
          '#$tagText',
          style: TextStyle(
            color: color,
          ),
        ),
      ),
      SizedBox(
        width: 8.0,
      )
    ],
  );
}

class DifficultyTag extends StatelessWidget {
  DifficultyTag({@required this.difficulty});

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: (){},
          child: Text(
            '$difficulty',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: (difficulty == 'Easy' ? kEasyColor : difficulty == 'Normal' ? kNormalColor : kHardColor),
        ),
        SizedBox(
          width: 8.0,
        )
      ],
    );
  }
}

