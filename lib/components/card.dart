import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';

class FlexibleTaskCard extends StatelessWidget {

  FlexibleTaskCard(this.flexibleTask);

  final Task flexibleTask;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: size.width * kCurrentTaskCardWidth,
          height: 300, //TODO: make constant?
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(flexibleTask.start.format(context),
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(' ------') //TODO: make it depend on time till next fixed or end of day
                ],
              ),
              SizedBox(
                height: kVerticalPaddingCurrentFlexible,
              ),
              Text(
                flexibleTask.name,
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
                //width: size.width - 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    DifficultyTag(
                      difficulty: flexibleTask.difficulty,
                    ),
                    for (String tag in flexibleTask.tags) Tag(tagText: tag,)
                  ], //TODO: list view builder?
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}