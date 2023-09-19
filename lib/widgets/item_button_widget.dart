import 'package:flutter/material.dart';
import 'package:pdthang/core/constant/color_palatte.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/core/hepper/TextStyles.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget(
      {Key? key, required this.data, this.color, this.width, this.onTap})
      : super(key: key);
  final String data;
  final Color? color;
  final double? width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold
                  .copyWith(color: ColorPalette.primaryColor),
        ),
      ),
    );
  }
}
