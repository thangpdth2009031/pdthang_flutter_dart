import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pdthang/core/constant/date_ext.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/pages/search_result_page.dart';
import 'package:pdthang/pages/select_date_page.dart';
import 'package:pdthang/widgets/app_bar_container.dart';
import 'package:pdthang/widgets/item_booking_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../widgets/item_button_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPage> {
  String? dateSelected;
  String? _selectedDate;
  String? destination;

  Widget getDateRangePicker() {
    return Container(
      height: 250,
      width: 250,
      child: Card(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    _selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: "Search destination",
            implementLeading: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: kDefaultPadding,),
                  const SizedBox(height: kDefaultPadding,),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return ItemBookingWidget(
                        title: "Select date",
                        icon: const Icon(
                          FontAwesomeIcons.calendar,
                          color: Colors.orange,
                        ),
                        description: dateSelected ?? "13 Feb - 31 Dec",
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectDateScreen()));
                              if (!(result as List<DateTime?>).any((element) => element == null)) {
                                dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                                setState(() {});
                              }
                        },
                      );
                    }
                  ),
                  const SizedBox(height: kDefaultPadding,),
                  ItemButtonWidget(
                    data: "Search",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => SearchResultPage(destination: destination,)
                        )
                      );
                    },
                  )
                ],
               )
             ),
           )
        )
      ),
    );
  }
}
