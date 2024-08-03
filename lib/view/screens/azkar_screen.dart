import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/models/Azkar.dart';
import 'package:quran/view%20models/Azkar.dart';
import 'package:quran/view/screens/azkar_details_screen.dart';

class Azkar_Screen extends StatefulWidget {
  const Azkar_Screen({super.key});

  @override
  State<Azkar_Screen> createState() => _Azkar_ScreenState();
}

class _Azkar_ScreenState extends State<Azkar_Screen> {
  var future;
  @override
  void initState() {
    future = AzkarViewModel().fetchListdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              "الاذكار",
              style: TextStyle(
                color: PrimaryColor,
                fontFamily: "noto",
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        backgroundColor: SecondaryColor,
      ),
      body: FutureBuilder<List<AzkarModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AzkarDetails_Screen(
                            title: snapshot.data![index].TITLE,
                            id: snapshot.data![index].ID),
                      ),
                    );
                  },
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Container(
                    height: MediaQuery.of(context).size.width - 230,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          SecondaryColor,
                          TertiaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -30,
                          bottom: -22,
                          child: SvgPicture.asset(
                            "assets/image/Mask_group.svg",
                            height: 220,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Center(
                            child: Text(
                              snapshot.data![index].TITLE,
                              style: TextStyle(
                                color: PrimaryColor,
                                fontFamily: "noto",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "OOPS there was error, try later",
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height / .5,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
