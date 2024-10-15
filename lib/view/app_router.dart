import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/view/screens/Duas_screen.dart';
import 'package:quran/view/screens/Quran_screen.dart';
import 'package:quran/view/screens/azkar_details_screen.dart';
import 'package:quran/view/screens/azkar_screen.dart';
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
      case Azkarscreen:
        return MaterialPageRoute(builder: (_) => Azkar_Screen());
      case DuasScreen:
        return MaterialPageRoute(builder: (_) => Duas_Screen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text("not found this route"))));
    }
  }
}
