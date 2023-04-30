import 'package:flutter/material.dart';
import 'package:hekkathon/consts/dimensions.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: kBottomBarIconSize,
            ),
            SizedBox(width: kDefaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
