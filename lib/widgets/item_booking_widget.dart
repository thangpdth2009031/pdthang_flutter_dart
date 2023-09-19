import 'package:flutter/material.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.description,
      this.onTap})
      : super(key: key);
  final Icon icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: kDefaultPadding * 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: kItemPadding,
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
