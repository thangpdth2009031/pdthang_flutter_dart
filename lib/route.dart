import 'package:flutter/material.dart';
import 'package:pdthang/pages/main_page.dart';
import 'package:pdthang/pages/welcome_page.dart';

final Map<String, WidgetBuilder> routes = {
  MainPage.routeName: (context) => const MainPage(),
  "/": (context) => const WelcomePage(),
};
