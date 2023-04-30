import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';
import 'package:hekkathon/widgets/item_button_widget.dart';
import 'package:hekkathon/widgets/item_change_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static const String routeName = '/screens/guest_and_room_booking_screen';

  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest =
      GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom =
      GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add guest and room',
      paddingContent: EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.iconGuest,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.iconRoom,
            value: 'Room',
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}
