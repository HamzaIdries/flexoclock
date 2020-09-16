import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

class HomescreenPart extends StatefulWidget {
  final String name;
  HomescreenPart(this.name);
  @override
  _HomescreenPartState createState() => _HomescreenPartState();
}

class _HomescreenPartState extends State<HomescreenPart> {
  List<Widget> cards;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${widget.name}',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (Widget card in cards)
          card,
      ],
    );
  }
}


class HomescreenCards extends StatefulWidget {
  HomescreenTasks homescreenTasks;
  HomescreenCards(this.homescreenTasks);
  @override
  _HomescreenCardsState createState() => _HomescreenCardsState();
}

class _HomescreenCardsState extends State<HomescreenCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomescreenPart(
          'Past'
        )
      ],
    );
  }
}
