import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/constants/string.dart';

class Tasbeeh_screen extends StatelessWidget {
  const Tasbeeh_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "اتجاة القبلة",
                  style: TextStyle(
                    color: PrimaryColor,
                    fontFamily: "noto",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: SecondaryColor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "سبحان الله ",
              style: TextStyle(
                color: SecondaryColor,
                fontFamily: "noto",
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "12",
              style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: "noto",
                fontSize: 100,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: SecondaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  surfaceTintColor: Colors.white,
                  disabledBackgroundColor: Colors.amber,
                ),
                onPressed: () {},
                child: Icon(
                  Icons.plus_one,
                  size: 50,
                  color: PrimaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
