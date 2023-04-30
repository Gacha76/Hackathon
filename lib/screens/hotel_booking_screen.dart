import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/screens/select_date_screen.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';
import 'package:hekkathon/widgets/button_widget.dart';
import 'package:hekkathon/widgets/item_booking_widget.dart';
import 'package:hekkathon/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static const String routeName = "/screens/hotel_booking_screen";

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Hotel Booking",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: FontAwesomeIcons.locationPin,
              title: "Destination",
              description: "Dandeli",
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return ItemBookingWidget(
                  icon: FontAwesomeIcons.calendar,
                  title: "Select date",
                  description: dateSelected ?? "13 Feb - 18 Feb 2023",
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (!(result as List<DateTime?>)
                        .any((element) => element == null)) {
                      dateSelected =
                          '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      setState(() {});
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: FontAwesomeIcons.bed,
              title: "Guest & Room",
              description: "2 Guests, 1 Room",
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: "Search",
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
