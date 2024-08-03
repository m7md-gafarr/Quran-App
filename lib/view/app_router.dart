import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/view/screens/Quran_screen.dart';
import 'package:quran/view/screens/intro_screen.dart';
import 'package:quran/view/screens/prayerTime_screen.dart';
import 'package:quran/view/screens/qibla_screen.dart';

import 'screens/home_screen.dart';
import 'screens/tasbeeh_screen.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      case IntroScreen:
        return MaterialPageRoute(builder: (_) => const Intro_screen());
      case HomeScreen:
        return MaterialPageRoute(builder: (_) => Home_screen());
      case QuranScreen:
        return MaterialPageRoute(builder: (_) => const Quran_Screen());
      case PrayerTimeScreen:
        return MaterialPageRoute(builder: (_) => Prayertime_Screen());
      case QiblaScreen:
        return MaterialPageRoute(builder: (_) => const Qibla_Screen());
      case Tasbeehscreen:
        return MaterialPageRoute(builder: (_) => Tasbeeh_screen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text("not found this route"))));
    }
  }
}
