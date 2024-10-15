import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran/models/Azkar.dart';
import 'package:quran/service/Duas.dart';

import '../../models/Duas.dart';
import '../../view models/Azkar.dart';

class Test_Screen extends StatelessWidget {
  const Test_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<DuasModel> list = await DuasService(Dio()).getListDouas();

            print("-----------------------------");

            print(list[2].arab);
          },
          child: const Text("get data"),
        ),
      ),
    );
  }
}
