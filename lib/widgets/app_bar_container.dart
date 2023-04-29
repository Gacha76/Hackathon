import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/dimensions.dart';

class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget({
    super.key,
    required this.child,
    this.title,
    this.implementLeading = false,
    this.titleString,
    this.implementTrailing = false,
  });

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTrailing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                titleString ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (implementTrailing)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            size: kDefaultPadding,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
