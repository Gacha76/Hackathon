import 'package:flutter/material.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/routes.dart';
import 'package:hekkathon/helper/local_storage_helper.dart';
import 'package:hekkathon/screens/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
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
