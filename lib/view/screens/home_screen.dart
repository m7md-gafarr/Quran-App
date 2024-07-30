import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/constants/string.dart';

import '../../models/popular_item.dart';
import '../widget/PopularItem.dart';

class Home_screen extends StatelessWidget {
  Home_screen({super.key});
  final List<PopularItemModel> _popularItemModel = [
    PopularItemModel(
      color: const Color(0xfff5faf4),
      path: "assets/icon/1.svg",
      text: "Quran",
    ),
    PopularItemModel(
        color: const Color(0xfffffaf0),
        path: "assets/icon/1.svg",
        text: "Prayer times"),
    PopularItemModel(
        color: const Color(0xfff5f6fd),
        path: "assets/icon/2.svg",
        text: "Recite"),
    PopularItemModel(
        color: const Color(0xfffef6f4),
        path: "assets/icon/1.svg",
        text: "Qibla"),
    PopularItemModel(
        color: const Color(0xfffef6f4),
        path: "assets/icon/1.svg",
        text: "Duas"),
    PopularItemModel(
        color: const Color(0xfffef6f4),
        path: "assets/icon/1.svg",
        text: "Azkar"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Hafiz",
          style: TextStyle(
            color: SecondaryColor,
            fontFamily: "poppins",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Iconsax.menu_1)),
        ),
        actions: [
          InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: const Icon(Iconsax.search_normal_1)),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width - 230,
              width: MediaQuery.of(context).size.width - 30,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   fit: BoxFit.fitWidth,
                //   image: Svg('assets/image/Mask_group.svg'),
                // ),
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
                  Positioned(
                    right: 10,
                    child: SvgPicture.asset(
                      "assets/image/image_intro.svg",
                      height: 190,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Last Read",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontFamily: "poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(
                          "الفاتحة",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Ayah no. 1",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontFamily: "poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: PrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                            ),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                color: SecondaryColor,
                                fontFamily: "poppins",
                                fontSize: 15,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular",
                style: TextStyle(
                  color: SecondaryColor,
                  fontFamily: "poppins",
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  pattern: [
                    const WovenGridTile(1),
                    const WovenGridTile(
                      5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: _popularItemModel.length,
                  (context, index) => PopularItemWidget(
                    popularItemModel: _popularItemModel[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const Drawer(
        shape: LinearBorder(),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
