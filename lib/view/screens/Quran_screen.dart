import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/string.dart';
import 'package:quran_app/models/Quran.dart';
import 'package:quran_app/view%20models/Quran.dart';

import '../../view models/Duas.dart';

class Quran_Screen extends StatefulWidget {
  const Quran_Screen({super.key});

  @override
  State<Quran_Screen> createState() => _Quran_ScreenState();
}

class _Quran_ScreenState extends State<Quran_Screen>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController tabController;
  var futureSura;
  var futurejuz;
  @override
  void initState() {
    futureSura = QuranViewModel().fetchListSurah();
    futurejuz = QuranViewModel().fetchListJuz();

    currentTab = 1;
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    );
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentTab && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newTab) {
    setState(() {
      currentTab = newTab;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
                  "الفهرس",
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
        bottom: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, double.minPositive + 30),
          child: TabBar(
            controller: tabController,
            indicatorWeight: 2,
            indicatorColor: PrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Text(
                'الاجزاء',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight:
                      currentTab == 0 ? FontWeight.bold : FontWeight.normal,
                  fontSize: 20.0,
                  color: currentTab == 0 ? PrimaryColor : TertiaryColor,
                ),
              ),
              Text(
                'السور',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight:
                      currentTab == 1 ? FontWeight.bold : FontWeight.normal,
                  fontSize: 20.0,
                  color: currentTab == 1 ? PrimaryColor : TertiaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FutureBuilder<List<QuranJuzModel>>(
            future: futurejuz,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _widget(
                              index: index + 1,
                              name: snapshot.data![index].number,
                              num: snapshot.data![index].page),
                        ));
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
          FutureBuilder<List<QuransurahModel>>(
            future: futureSura,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _widgetSurah(
                              index: snapshot.data![index].number,
                              name: snapshot.data![index].name,
                              num: snapshot.data![index].numberOfAyahs),
                        ));
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
        ],
      ),
    );
  }

  Widget _widget({required int index, required String name, required int num}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(.2),
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              Text(
                "صفحة  $num",
                style: TextStyle(
                  color: SecondaryColor,
                  fontFamily: "noto",
                  fontSize: 16,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                      color: SecondaryColor,
                      fontFamily: "noto",
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    ".$index",
                    style: TextStyle(
                      color: SecondaryColor,
                      fontFamily: "noto",
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _widgetSurah(
      {required int index, required String name, required int num}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(.2),
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              Text(
                "صفحة  $num",
                style: TextStyle(
                  color: SecondaryColor,
                  fontFamily: "noto",
                  fontSize: 16,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                      color: SecondaryColor,
                      fontFamily: "noto",
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    ".$index",
                    style: TextStyle(
                      color: SecondaryColor,
                      fontFamily: "noto",
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
