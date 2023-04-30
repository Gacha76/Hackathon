import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/screens/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = "/screens/main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(color: Colors.blue),
          Container(color: Colors.brown),
          Container(color: Colors.yellow),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: EdgeInsets.symmetric(
          horizontal: kMediumPadding,
          vertical: kDefaultPadding,
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultIconSize,
            ),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.map,
              size: kDefaultIconSize,
            ),
            title: Text("Maps"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.briefcase,
              size: kDefaultIconSize,
            ),
            title: Text("Booking"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultIconSize,
            ),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
