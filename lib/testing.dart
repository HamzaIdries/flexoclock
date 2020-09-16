import 'package:flexoclock/components/login_background.dart';
import 'package:flexoclock/components/nav_bar.dart';
import 'package:flexoclock/screens/home_screen.dart';
import 'package:flexoclock/screens/login_screen.dart';
import 'package:flexoclock/screens/profile_screen.dart';
import 'package:flexoclock/screens/signup_screen.dart';
import 'package:flexoclock/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flexoclock/components/text_field.dart';
import 'package:flexoclock/components/text_field_comp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:flexoclock/components/rounded_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(Testing());
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

int _navBar = 0;

List<dynamic> _widgetOptions = <dynamic>[
  LoginScreen(),
  WelcomeScreen(),
  SignupScreen(),
  ProfileScreen(),
];

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexoclock',
      home: Scaffold(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                  selectedIndex: _navBar,
                  onTabChange: (index) {
                    setState(() {
                      _navBar = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
