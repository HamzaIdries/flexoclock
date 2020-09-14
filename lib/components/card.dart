import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexibleTaskCard extends StatelessWidget {

  final String taskTitle;

  FlexibleTaskCard({this.taskTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: size.width * kCurrentTaskCardWidth,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('10:30 AM',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(' ------')
                ],
              ),
              SizedBox(
                height: kVerticalPaddingCurrentFlexible,
              ),
              Text(
                'Study and research',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: kVerticalPaddingCurrentFlexible,
              ),
              Container(
                height: kTagsHeight,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    DifficultyTag(difficulty: 'Hard'),
                    DifficultyTag(difficulty: 'Normal'),
                    DifficultyTag(difficulty: 'Easy'),
                    Tag(tagText: 'University'),
                    Tag(tagText: 'Engineering'),
                    Tag(tagText: 'Maths'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}