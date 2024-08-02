import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/Bloc/cubit/prayer_time_cubit.dart';
import 'package:quran/constants/string.dart';
import 'package:quran/models/Prayertime.dart';
import 'package:quran/view/widget/prayertime.dart';

class Prayertime_Screen extends StatefulWidget {
  const Prayertime_Screen({super.key});

  @override
  State<Prayertime_Screen> createState() => _PrayertimeScreenState();
}

class _PrayertimeScreenState extends State<Prayertime_Screen> {
  PrayertimeModel? prayertimeModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PrayerTimeCubit>(context).fetchdata();
  }

  Widget buildBlocBuilderAppBar() {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading && prayertimeModel == null) {
          return LoadingWidget();
        } else if (state is PrayerTimeSucsses) {
          prayertimeModel = state.prayertimeModel;
          return AppBarWidget();
        } else {
          return Text("Error");
        }
      },
    );
  }

  Widget buildBlocBuilderBody() {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading && prayertimeModel == null) {
          return LoadingWidget();
        } else if (state is PrayerTimeSucsses) {
          prayertimeModel = state.prayertimeModel;
          return BodyWidget();
        } else {
          return Text("Error");
        }
      },
    );
  }

  Widget BodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PrayertimeWidget(
          txt: "الفجر",
          Time: prayertimeModel!.timing.Fajr,
          Am: true,
        ),
        PrayertimeWidget(
          txt: "الشروق",
          Time: prayertimeModel!.timing.Sunrise,
          Am: true,
        ),
        PrayertimeWidget(
          txt: "الظهر",
          Time: prayertimeModel!.timing.Dhuhr,
          Am: true,
        ),
        PrayertimeWidget(
          txt: "العصر",
          Time: prayertimeModel!.timing.Asr,
          Am: true,
        ),
        PrayertimeWidget(
          txt: "المغرب",
          Time: prayertimeModel!.timing.Maghrib,
          Am: true,
        ),
        PrayertimeWidget(
          txt: "العشاء",
          Time: prayertimeModel!.timing.Isha,
          Am: true,
        ),
      ],
    );
  }

  Widget AppBarWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "اليوم ${prayertimeModel!.data.dayName} ${prayertimeModel!.data.dayGregorian} ${prayertimeModel!.data.monthGregorian}",
          style: TextStyle(
            color: PrimaryColor,
            fontFamily: "noto",
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            Text(
              ''' ${prayertimeModel!.data.monthHijri} ${prayertimeModel!.data.year} ه''',
              style: TextStyle(
                color: PrimaryColor,
                fontFamily: "noto",
                fontSize: 18,
              ),
            ),
            Text(
              ''' ${prayertimeModel!.data.dayHijri}''',
              style: TextStyle(
                color: PrimaryColor,
                fontFamily: "noto",
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget LoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "مواقيت الصلاة",
                  style: TextStyle(
                    color: PrimaryColor,
                    fontFamily: "noto",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "الموقع",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontFamily: "noto",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Iconsax.location,
                      color: PrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        backgroundColor: SecondaryColor,
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.width - 140,
          ),
          child: Column(
            children: [
              const Text(
                "باقى على اذان الظهر ",
                style: TextStyle(
                  color: PrimaryColor,
                  fontFamily: "noto",
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                "03 : 22 : 52",
                style: TextStyle(
                  color: PrimaryColor,
                  fontFamily: "noto",
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.width - 200) / 2,
              ),
              Container(
                color: TertiaryColor.withOpacity(.2),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      color: PrimaryColor,
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_left_2),
                    ),
                    buildBlocBuilderAppBar(),
                    IconButton(
                      color: PrimaryColor,
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: buildBlocBuilderBody(),
    );
  }
}
