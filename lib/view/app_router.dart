import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/view/screens/home_screen.dart';
import 'package:quran/view/screens/text.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen:
        return MaterialPageRoute(builder: (_) => const Home_screen());
      default:
        return MaterialPageRoute(builder: (_) => const tesst());
    }
  }
}
