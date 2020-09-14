import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

String checkTagText(String tagText) {
  int charLimit = 20;
  if (tagText.length > charLimit)
    return tagText.substring(0, 17) + "...";
  else
    return tagText;
}

class Tag extends StatelessWidget {
  Tag({@required this.tagText});

  final String tagText;


  @override
  Widget build(BuildContext context) {
    String checkedTagText = checkTagText(tagText);
    return Row(
      children: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black)
          ),
          onPressed: (){},
          child: Text(
            '#$checkedTagText',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          color: Colors.white,
        ),
        SizedBox(
          width: 8.0,
        )
      ],
    );
  }
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

