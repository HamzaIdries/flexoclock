import 'fixed_components.dart';
import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';
import 'package:flexoclock/components/cards/common_components.dart';

class FixedTaskCard extends StatelessWidget {
  final Task fixedTask;

  FixedTaskCard(this.fixedTask);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      width: size.width,
      color: kFixedCardBG,
      child: Column(
        children: <Widget>[
          fixedTitle(fixedTask.name),
          fixedTime(fixedTask.start, fixedTask.end, context),
          displayRepetition(fixedTask.repetition),
          tagsList(fixedTask.tags, Colors.white),
          if (fixedTask.isCurrent && fixedTask.displayButtons)
            startTask(Colors.white, false),
          // cont.
        ],
      ),
    );
  }
}