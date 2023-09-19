import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/widgets/app_bar_container.dart';
import 'package:pdthang/widgets/item_trip_widget.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, this.destination, this.isLeading});

  static const routeName = "/search_result_page";
  final String? destination;
  final bool? isLeading;

  @override
  State<SearchResultPage> createState() => _SearchResultPage();
}

class _SearchResultPage extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: widget.destination ?? 'Destination',
            implementLeading: widget.isLeading ?? true,
            child: Column(
              children: [
                TextField(
                  enabled: true,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Search your destination',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(kItemPadding),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: kItemPadding),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    height: 16 / 14,
                  ),
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(5, (index) => ItemTrip()),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
