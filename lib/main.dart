import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Bloc/cubit/prayer_time_cubit.dart';
import 'package:quran/constants/string.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PrayerTimeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generate_route,
        initialRoute: HomeScreen,
        // home: Test_Screen(),
      ),
    );
  }
}
