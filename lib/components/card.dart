import 'package:flutter/material.dart';

class FlexibleTaskCard extends StatelessWidget {

  final String taskTitle;

  FlexibleTaskCard({this.taskTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        child: Stack(

        ),
      ),
    );
  }
}