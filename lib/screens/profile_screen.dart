import 'package:flutter/material.dart';
import 'package:flexoclock/constants.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  ProfileScreen({this.userName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: 400,
                  color: kProfileClipperColor,
                ),
              ),
              Positioned(
                top: 200,
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xfffafafa),
                    child: Image.asset('${kImagePath}person.png')),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            userName,
            style: kProfileUserNameStyle,
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 150.0);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
