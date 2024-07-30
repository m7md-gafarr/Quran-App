import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/models/popular_item.dart';

class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({super.key, required this.popularItemModel});
  final PopularItemModel popularItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, "routeName");
      },
      child: Container(
        decoration: BoxDecoration(
            color: popularItemModel.color,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  popularItemModel.text,
                  style: const TextStyle(
                    color: SecondaryColor,
                    fontFamily: "poppins",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  popularItemModel.path,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
