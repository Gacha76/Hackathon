import 'package:flutter/material.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Home",
      implementLeading: true,
      implementTrailing: true,
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
