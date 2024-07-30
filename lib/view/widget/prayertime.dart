import 'package:flutter/material.dart';
import 'package:quran/constants/string.dart';

class PrayertimeWidget extends StatelessWidget {
  const PrayertimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      trailing: const Text(
        "الفجر",
        style: TextStyle(
          color: SecondaryColor,
          fontFamily: "noto",
          fontSize: 18,
        ),
      ),
      leading: const Text(
        " 40 : 30 ص",
        style: TextStyle(
          color: SecondaryColor,
          fontFamily: "noto",
          fontSize: 18,
        ),
      ),
    );
  }
}
