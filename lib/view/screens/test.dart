import 'package:flutter/material.dart';
import 'package:quran/models/Azkar.dart';

import '../../view models/Azkar.dart';

class Test_Screen extends StatelessWidget {
  const Test_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<AzkarModel> list = await AzkarViewModel().fetchListdata();

            print("-----------------------------");

            List<Contant> list1 = await AzkarViewModel()
                .fetchZkerdata(id: list[2].ID, Zker: list[2].TITLE);

            print(list1[2].ARABIC_TEXT);
          },
          child: const Text("get data"),
        ),
      ),
    );
  }
}
