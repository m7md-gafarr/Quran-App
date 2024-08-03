// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:quran/models/Azkar.dart';
import 'package:quran/view%20models/Azkar.dart';

import '../../constants/string.dart';

class AzkarDetails_Screen extends StatefulWidget {
  AzkarDetails_Screen({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);
  final String title;
  final int id;

  @override
  State<AzkarDetails_Screen> createState() => _AzkarDetails_ScreenState();
}

class _AzkarDetails_ScreenState extends State<AzkarDetails_Screen> {
  var future;
  @override
  void initState() {
    future = AzkarViewModel().fetchZkerdata(id: widget.id, Zker: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
          style: TextStyle(
            color: PrimaryColor,
            fontFamily: "noto",
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: SecondaryColor,
      ),
      body: FutureBuilder<List<Contant>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        TertiaryColor,
                        TertiaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data![index].ARABIC_TEXT,
                          style: TextStyle(
                            color: SecondaryColor,
                            fontFamily: "noto",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
