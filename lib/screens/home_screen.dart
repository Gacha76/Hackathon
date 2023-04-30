import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/screens/hotel_booking_screen.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _builtItemCategory(
    Icon icon,
    Color color,
    Function() onTap,
    String title,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                kItemPadding,
              ),
            ),
            child: icon,
          ),
          SizedBox(height: kItemPadding),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hi Tourist!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  "Where are you going next?",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(width: kTopPadding),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kTopPadding),
              child: Icon(
                FontAwesomeIcons.solidUser,
                size: kDefaultIconSize,
                color: ColorPalette.primaryColor,
              ),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search your destination",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kItemPadding,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: [
              Expanded(
                child: _builtItemCategory(
                  Icon(
                    FontAwesomeIcons.hotel,
                    size: kBottomBarIconSize,
                  ),
                  Color(0xffFE9C5E),
                  () {
                    Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                  },
                  "Hotels",
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                  Icon(
                    FontAwesomeIcons.car,
                    size: kBottomBarIconSize,
                  ),
                  Color(0xffF77777),
                  () {},
                  "Cabs",
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                  Icon(
                    FontAwesomeIcons.globe,
                    size: kBottomBarIconSize,
                  ),
                  Color(0xff3EC88C),
                  () {},
                  "All",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
