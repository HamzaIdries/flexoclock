import 'package:flexoclock/components/cards_section.dart';
import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/todo_list_screen/tasks_list.dart';
import 'package:flexoclock/user_data.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserData userData = UserData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  width: size.width,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
