import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/consts/text_style.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/helper/image_helper.dart';
import 'package:hekkathon/screens/main_screen.dart';
import 'package:hekkathon/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/screens/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(
    String image,
    String title,
    String description,
    AlignmentGeometry alignment,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 375,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                AssetHelper.transport,
                "Book a cab",
                "Need a cab that's going towards your destination? Book it instantly.",
                Alignment.centerRight,
              ),
              _buildItemIntroScreen(
                AssetHelper.hotel,
                "Find a hotel room",
                "Select the day, book your room. We give you the best price.",
                Alignment.center,
              ),
              _buildItemIntroScreen(
                AssetHelper.explore,
                "Enjoy your trip",
                "Easy discovering new places & share these between your friends & travel together.",
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ButtonWidget(
                        title: snapshot.data != 2 ? "Next" : "Get started",
                        ontap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.of(context)
                                .pushNamed(MainScreen.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
