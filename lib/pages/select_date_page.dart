import 'package:flutter/material.dart';
import 'package:pdthang/core/constant/color_palatte.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/widgets/app_bar_container.dart';
import 'package:pdthang/widgets/item_button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);

  static const String routeName = "/select_date_screen";

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBarContainer(
        titleString: 'Select Date',
        paddingContent: const EdgeInsets.all(kMediumPadding),
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              selectableDayPredicate: (DateTime date) {
                return date.compareTo(DateTime.now()) >= 0 ? true : false;
              },
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }
              },
            ),
            ItemButtonWidget(
              data: 'Select',
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemButtonWidget(
              data: 'Cancel',
              color: ColorPalette.primaryColor.withOpacity(0.1),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
