import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/view/screens/intro_screen.dart';

import 'screens/home_screen.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      case IntroScreen:
        return MaterialPageRoute(builder: (_) => const Intro_screen());
      case HomeScreen:
        return MaterialPageRoute(builder: (_) => Home_screen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text("not found this route"))));
    }
  }
}
