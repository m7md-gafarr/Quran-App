import 'package:dio/dio.dart';

import '../models/Prayertime.dart';
import '../service/PrayerTime.dart';

class PrayertimeViewModel {
  List<PrayertimeModel>? ListPrayertime;
  Future<PrayertimeModel> fetchdata() async {
    PrayertimeModel service = await PrayerTimeService(Dio()).getPrayerTime();
    return service;
  }
}
