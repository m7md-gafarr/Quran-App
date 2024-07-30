import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/view/app_router.dart';
import 'package:quran/view/screens/test.dart';

void main() {
  runApp(
    QuranApp(
      appRoute: AppRouter(),
    ),
  );
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key, required this.appRoute});
  final AppRouter appRoute;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: appRoute.generate_route,
      // initialRoute: HomeScreen,
      home: Test_Screen(),
    );
  }
}
