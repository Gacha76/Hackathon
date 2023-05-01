import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/consts/text_style.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/screens/welcome_screen.dart';
import 'package:hekkathon/widgets/item_intro_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    ItemIntroWidget(
      title: 'Book a cab',
      description:
          "Need a cab that's going towards your destination? Book it instantly.",
      sourceImage: AssetHelper.transport,
      aligment: Alignment.centerRight,
    ),
    ItemIntroWidget(
      title: 'Find a hotel room',
      description:
          'Select the day, book your room. We give you the best price.',
      sourceImage: AssetHelper.hotel,
      aligment: Alignment.center,
    ),
    ItemIntroWidget(
      title: 'Enjoy your trip',
      description:
          'Easy discovering new places & share these between your friends and travel together.',
      sourceImage: AssetHelper.explore,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Navigator.of(context).pushNamed(WelcomeScreen.routeName);
                    } else {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: kMediumPadding * 2,
                        vertical: kDefaultPadding),
                    child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Next' : 'Get Started',
                          style: TextStyles.defaultStyle.whiteTextColor.bold,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
