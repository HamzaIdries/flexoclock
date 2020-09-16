import 'package:flexoclock/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flexoclock/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              ClipPath(
                //clipper: CustomClipper(),
                child: Container(
                  height: 400,
                  child: Image.asset('${kImagePath}cliff.png',),
                ),
              ),
              TopBar(),
            ],
          ),
      ),
    );
  }
}
