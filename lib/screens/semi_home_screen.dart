import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/profile_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SemiHomeScreen extends StatefulWidget {
  @override
  _SemiHomeScreenState createState() => _SemiHomeScreenState();
}

int _navBar = 0;

//TODO : change all screens

List<dynamic> _widgetOptions = <dynamic>[
  LoginScreen(),
  WelcomeScreen(),
  ProfileScreen(userName: 'John Nusserat'),
];

class _SemiHomeScreenState extends State<SemiHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_navBar),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _navBar,
                onTabChange: (index) {
                  setState(() {
                    _navBar = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
