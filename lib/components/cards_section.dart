import 'package:flexoclock/components/cards/task_card.dart';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

class CardsSection extends StatelessWidget {
  String name;
  List<Task> tasks;

  CardsSection(this.name, this.tasks);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 8, 8, 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '$name',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
        if (tasks != null)
          for (Task task in tasks)
            TaskCard(task),
      ],
    );
  }
}
