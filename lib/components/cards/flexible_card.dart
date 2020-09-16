import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';
import 'package:flexoclock/components/cards/common_components.dart';
import 'package:flexoclock/components/cards/flexible_components.dart';

class FlexibleTaskCard extends StatelessWidget {
  final Task flexibleTask;

  FlexibleTaskCard(this.flexibleTask);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final bool isCurrent =
        flexibleTask.start != null && flexibleTask.finish == null;
    final bool isFuture =
        flexibleTask.start == null && flexibleTask.finish == null;
    final bool isPast =
        flexibleTask.start != null && flexibleTask.finish != null;

    final ImageProvider image = AssetImage('assets/images/cliff.png');

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
        ),
        margin: EdgeInsets.all(12.0),
        width: size.width * kFlexibleWidth,
        //height: kFlexibleHeight, //TODO: make height constant or not?
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flexibleHeader(flexibleTask, context),
            flexibleTime(flexibleTask.start, flexibleTask.finish, context),
            flexibleTitle(flexibleTask.name),
            tagsList(flexibleTask.tags, Colors.black),
            if (isCurrent && flexibleTask.hasStarted)
              currentTaskChoices()
            else if (isCurrent && !flexibleTask.hasStarted)
              startTask(Colors.black, true),
            if (flexibleTask.hasDeadline != null)
              displayDeadline(flexibleTask.deadline),
          ],
        ),
      ),
    );
  }
}
