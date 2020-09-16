import 'package:flexoclock/components/cards_section.dart';
import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/todo_list_screen/tasks_list.dart';
import 'package:flexoclock/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/user_data.dart';

void main() {
  runApp(Testing());
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    UserData userData = UserData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: false,
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  child: Image.asset(
                    '${kImagePath}main_background05.png',
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    if (userData.tasksList != null)
                      CardsSection('Current', [userData.tasksList.getCurrentTask()]),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
