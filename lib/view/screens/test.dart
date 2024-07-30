import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/Prayertime.dart';
import '../../service/PrayerTime.dart';
import '../../view models/prayerTimeViewModel.dart';

class Test_Screen extends StatelessWidget {
  const Test_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {},
          child: const Text("get data"),
        ),
      ),
    );
  }
}
