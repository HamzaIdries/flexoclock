//TODO : change everything in

import 'package:flexoclock/screens/home_screen.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/profile_screen.dart';
import 'package:flexoclock/screens/signup_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flexoclock/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

int _selectedIndex = 0;

class _NavBarState extends State<NavBar> {
  List<dynamic> _widgetOptions = <dynamic>[
    LoginScreen(),
    WelcomeScreen(),
    SignupScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
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
                  icon: FontAwesomeIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: FontAwesomeIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
