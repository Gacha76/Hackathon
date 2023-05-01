import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/consts/text_style.dart';
import 'package:hekkathon/helper/image_helper.dart';
import 'package:hekkathon/model/room_model.dart';
import 'package:hekkathon/widgets/dash_line.dart';
import 'package:hekkathon/widgets/item_button_widget.dart';
import 'package:hekkathon/widgets/item_utility_hotel.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({
    super.key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  });

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(roomModel.roomImage, radius: BorderRadius.circular(kItemPadding)),
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ItemButtonWidget(
                        title: 'Choose',
                        ontap: onTap,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
