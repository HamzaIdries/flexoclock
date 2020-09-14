import 'package:flexoclock/constants.dart';
import 'package:flutter/material.dart';

class FlexibleTaskCard extends StatelessWidget {

  final String taskTitle;

  FlexibleTaskCard({this.taskTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: size.width * kCurrentTaskCardWidth,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('10:30 AM',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(' ------')
                ],
              ),
              kSpace,
              Text(
                'Study and research',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              kSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: (){},
                    child: Text(
                      'Hard',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.purple,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black)
                    ),
                    onPressed: (){},
                    child: Text(
                      '#Education',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.black)
                    ),
                    onPressed: (){},
                    child: Text(
                      '#Collage',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}