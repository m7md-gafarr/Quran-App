// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quran_app/models/Azkar.dart';
import 'package:quran_app/models/Duas.dart';
import '../../constants/string.dart';
import '../../view models/Duas.dart';

class Duas_Screen extends StatefulWidget {
  Duas_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Duas_Screen> createState() => _AzkarDetails_ScreenState();
}

class _AzkarDetails_ScreenState extends State<Duas_Screen> {
  var future;
  @override
  void initState() {
    future = DuasViewModel().fetchListdata();
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
              "الادعية",
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
      body: FutureBuilder<List<DuasModel>>(
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
                          snapshot.data![index].arab,
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
