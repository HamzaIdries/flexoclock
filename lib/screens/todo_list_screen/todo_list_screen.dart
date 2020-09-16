import 'package:flexoclock/components/cards_section.dart';
import 'package:flexoclock/screens/homescreen/homescreen_tasks.dart';
import 'package:flexoclock/components/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/flexible_card.dart';
import 'package:flexoclock/components/cards/fixed_card.dart';

void main() => runApp(TodoListScreen());

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              // TODO: todo or choose
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Todo List', // TODO: or change task
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CardsSection('Fixed Tasks'),
              CardsSection('Deadlines'),
              CardsSection('Easy Flexible Tasks'),
              CardsSection('Normal Flexible Tasks'),
              CardsSection('Hard Flexible Tasks'),
            ],
          ),
        ),
      ),
    );
  }
}
