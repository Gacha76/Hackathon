import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/consts/text_style.dart';
import 'package:hekkathon/helper/asset_helper.dart';
import 'package:hekkathon/helper/image_helper.dart';
import 'package:hekkathon/model/hotel_model.dart';
import 'package:hekkathon/widgets/dash_line.dart';
import 'package:hekkathon/widgets/item_button_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({
    super.key,
    required this.hotelModel,
    this.onTap,
  });

  final HotelModel hotelModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.iconLocationBlank,
                    ),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                    ),
                    Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.iconStar,
                    ),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
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
                      child: ItemButtonWidget(
                        title: 'Book a room',
                        ontap: onTap,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
