import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/screens/guest_and_room_booking_screen.dart';
import 'package:hekkathon/screens/hotel_screen.dart';
import 'package:hekkathon/screens/select_date_screen.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';
import 'package:hekkathon/widgets/item_button_widget.dart';
import 'package:hekkathon/extensions/date_ext.dart';
import 'package:hekkathon/widgets/item_options_booking.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});

  static const String routeName = "/hotel_booking_screen";

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemOptionsBookingWidget(
              title: 'Destination',
              value: widget.destination ?? 'Dandeli',
              icon: AssetHelper.iconLocation,
              onTap: () {},
            ),
            ItemOptionsBookingWidget(
              title: 'Select Date',
              value: selectDate ?? 'Select date',
              icon: AssetHelper.iconCalendar,
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(SelectDateScreen.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            ItemOptionsBookingWidget(
              title: 'Guest and Room',
              value: guestAndRoom ?? 'Guest and Room',
              icon: AssetHelper.iconBed,
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(GuestAndRoomBookingScreen.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            ItemButtonWidget(
              title: 'Search',
              ontap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
