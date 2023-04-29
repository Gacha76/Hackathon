import 'package:flutter/material.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/helper/image_helper.dart';
import 'package:hekkathon/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/screens/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectWelcomeScreen();
  }

  void redirectWelcomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Navigator.of(context).pushNamed(WelcomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.splash,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
