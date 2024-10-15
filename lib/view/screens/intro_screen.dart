import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/constants/string.dart';

class Intro_screen extends StatelessWidget {
  const Intro_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -60,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color(0xffe9f7ef),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
            Positioned(
              top: -20,
              left: -60,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xffe0f3e7).withOpacity(.7),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.width - 50,
                      width: MediaQuery.of(context).size.width - 90,
                      decoration: const BoxDecoration(
                        color: SecondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: SvgPicture.asset("assets/image/image_intro.svg"),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Hafiz",
                      style: TextStyle(
                        color: TertiaryColor,
                        fontFamily: "poppins",
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Learn Quran and\nRecite everyday",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "poppins",
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: TertiaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        surfaceTintColor: Colors.white,
                        disabledBackgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen);
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: SecondaryColor,
                          fontFamily: "poppins",
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
