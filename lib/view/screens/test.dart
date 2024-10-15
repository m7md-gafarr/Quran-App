import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:quran_app/models/Quran.dart';

import '../../service/Quran.dart';

class Test_Screen extends StatelessWidget {
  const Test_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<QuranJuzModel> list =
                await QuranService(Dio()).GetListQuranJuz();

            print("-----------------------------");

            print(list[0].page);
          },
          child: const Text("get data"),
        ),
      ),
    );
  }
}
