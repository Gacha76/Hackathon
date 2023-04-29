import 'package:flutter/material.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/routes.dart';
import 'package:hekkathon/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourZone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      home: const SplashScreen(),
    );
  }
}