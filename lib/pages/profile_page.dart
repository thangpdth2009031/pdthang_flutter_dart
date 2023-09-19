import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/color_palatte.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:pdthang/core/hepper/ImageHelper.dart';
import 'package:pdthang/pages/search_result_page.dart';
import 'package:pdthang/widgets/app_bar_container.dart';
import 'package:pdthang/widgets/app_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = "/main_page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: "Profile",
            implementLeading: false,
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: ImageHelper.loadFromAsset(
                      "assets/images/profile.jpg",
                      radius: BorderRadius.circular(140),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover
                    )
                  ),
                  const SizedBox(
                    height: kMinPadding,
                  ),
                  Center(
                    child: AppText(text: "T2108E"),
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 3,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(0),
                          sliver: SliverGrid.count(
                            crossAxisCount: 10,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 3,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultPage()));
                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.book, color: ColorPalette.primaryColor,),
                                    const SizedBox(
                                      height: kMinPadding,
                                    ),
                                    AppText(text: "Book a trip"),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultPage(destination: "MY TRIPS", isLeading: true,)));
                                },
                                child: Column(
                                  children: [
                                    Icon(FontAwesomeIcons.peopleLine, color: Colors.blue.withOpacity(0.5),),
                                    const SizedBox(
                                      height: kMinPadding,
                                    ),
                                    AppText(text: "My trips"),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultPage(destination: "LOVE", isLeading: true,)));
                                },
                                child: Column(
                                  children: [
                                    Icon(FontAwesomeIcons.solidHeart, color: Colors.red,),
                                    const SizedBox(
                                      height: kMinPadding,
                                    ),
                                    AppText(text: "Love"),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.settings, color: Colors.black.withOpacity(0.6),),
                                  const SizedBox(
                                    height: kMinPadding,
                                  ),
                                  AppText(text: "Settings"),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(FontAwesomeIcons.moneyBill, color: Colors.grey.withOpacity(0.5),),
                                  const SizedBox(
                                    height: kMinPadding,
                                  ),
                                  AppText(text: "Bills")
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(FontAwesomeIcons.share, color: ColorPalette.primaryColor,),
                                  const SizedBox(
                                    height: kMinPadding,
                                  ),
                                  AppText(text: "Shared")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
