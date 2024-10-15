import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/Bloc/Tasbeeh_Cubit/tasbeeh_cubit.dart';
import 'package:quran_app/constants/string.dart';

class Tasbeeh_screen extends StatefulWidget {
  Tasbeeh_screen({super.key});

  @override
  State<Tasbeeh_screen> createState() => _Tasbeeh_screenState();
}

class _Tasbeeh_screenState extends State<Tasbeeh_screen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TasbeehCubit>(context).Rest();
  }

  Widget BlocBuilder() {
    return BlocConsumer<TasbeehCubit, TasbeehState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TasbeehCountChange)
          return WidgetData();
        else if (state is TasbeehFinsh) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "قال رسول الله صلى الله عليه وسلم: \"كلمتان خفيفتان على اللسان، ثقيلتان في الميزان، حبيبتان إلى الرحمن: سبحان الله وبحمده، سبحان الله العظيم\"",
                style: TextStyle(
                  color: SecondaryColor,
                  fontFamily: "noto",
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else
          return WidgetData();
      },
    );
  }

  Widget WidgetData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          BlocProvider.of<TasbeehCubit>(context)
              .TasbeehList[BlocProvider.of<TasbeehCubit>(context).index]
              .text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: SecondaryColor,
            fontFamily: "noto",
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          BlocProvider.of<TasbeehCubit>(context).count.toString(),
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: "noto",
            fontSize: 100,
            fontWeight: FontWeight.w600,
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: SecondaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                surfaceTintColor: Colors.white,
                disabledBackgroundColor: Colors.amber,
              ),
              onPressed: () {
                if (BlocProvider.of<TasbeehCubit>(context).count < 100) {
                  BlocProvider.of<TasbeehCubit>(context).Count();
                }
              },
              child: Icon(
                Icons.plus_one,
                size: 50,
                color: PrimaryColor,
              ),
            ),
            SizedBox(height: 15),
            IconButton(
              onPressed: () {
                BlocProvider.of<TasbeehCubit>(context).Rest();
              },
              icon: Icon(
                Iconsax.repeat,
                size: 35,
                color: SecondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Iconsax.arrow_left,
          color: PrimaryColor,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "التسبيح",
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
        child: BlocBuilder(),
      ),
    );
  }
}
