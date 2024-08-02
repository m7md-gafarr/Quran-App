// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quran/constants/string.dart';

class PrayertimeWidget extends StatelessWidget {
  const PrayertimeWidget({
    Key? key,
    required this.txt,
    required this.Time,
    required this.Am,
  }) : super(key: key);
  final String txt;
  final String Time;
  final bool Am;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      trailing: Text(
        "$txt",
        style: TextStyle(
          color: SecondaryColor,
          fontFamily: "noto",
          fontSize: 18,
        ),
      ),
      leading: Text(
        "$Time",
        style: TextStyle(
          color: SecondaryColor,
          fontFamily: "noto",
          fontSize: 18,
        ),
      ),
    );
  }
}
