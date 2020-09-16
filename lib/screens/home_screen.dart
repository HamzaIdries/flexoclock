import 'package:flexoclock/constants.dart';
import 'package:flexoclock/screens/semi_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: SemiHomeScreen(),
      body: SafeArea(
        child: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('${kImagePath}welcome_ mountain.png'),
            ],
          ),
        ),
      ),
    );
  }
}
