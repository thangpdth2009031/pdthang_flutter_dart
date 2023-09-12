import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdthang/core/constant/app_color.dart';
import 'package:pdthang/core/constant/dimension_constant.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const routeName = "/main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: [
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.pink),
              Container(color: Colors.red)
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
              _currentIndex = index;
              });
            },
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.primaryColor.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kMinPadding),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kDefaultIconSize,
                ),
                title: const Text("HOME"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.search,
                  size: kDefaultIconSize,
                ),
                title: const Text("Search")
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.briefcase,
                  size: kDefaultIconSize,
                ),
                title: const Text("BOOKING")
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidUser,
                  size: kDefaultIconSize,
                ),
                title: const Text("PROFILE")
              )
            ],
          ),
        )
      ),
    );
  }
}
