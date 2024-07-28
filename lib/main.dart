import 'package:flutter/material.dart';
import 'package:quran/view/app_router.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generate_route,
    );
  }
}
