import 'package:flutter/material.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/helper/image_helper.dart';
import 'package:hekkathon/helper/local_storage_helper.dart';
import 'package:hekkathon/screens/intro_screen.dart';
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
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue("ignoreIntroScreen") as bool?;
    await Future.delayed(const Duration(seconds: 2));
    if (ignoreIntroScreen ?? false) {
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }
    } else {
      LocalStorageHelper.setValue("ignoreIntroScreen", true);
      if (context.mounted) {
        Navigator.of(context).pushNamed(IntroScreen.routeName);
      }
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
