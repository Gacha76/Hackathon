import 'package:flutter/material.dart';
import 'package:hekkathon/screens/hotel_booking_screen.dart';
import 'package:hekkathon/screens/hotel_screen.dart';
import 'package:hekkathon/screens/intro_screen.dart';
import 'package:hekkathon/screens/main_screen.dart';
import 'package:hekkathon/screens/select_date_screen.dart';
import 'package:hekkathon/screens/splash_screen.dart';
import 'package:hekkathon/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
};
