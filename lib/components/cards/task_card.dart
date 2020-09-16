import 'package:flexoclock/components/cards/fixed_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/tags.dart';
import 'package:flexoclock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:intl/intl.dart';
import 'package:flexoclock/components/cards/common_components.dart';
import 'package:flexoclock/components/cards/flexible_components.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  TaskCard(this.task);
  @override
  Widget build(BuildContext context) {
    return task.type == 'Flexible' ? FlexibleTaskCard(task)
        : FixedTaskCard(task);
  }
}
