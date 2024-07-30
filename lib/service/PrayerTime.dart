import 'package:dio/dio.dart';

import '../models/Prayertime.dart';

class PrayerTimeService {
  final Dio dio;

  PrayerTimeService(this.dio);

  Future<PrayertimeModel> getPrayerTime() async {
    try {
      Response response = await dio.get(
          "https://api.aladhan.com/v1/timingsByCity/30-07-2024?city=cairo&country=egypt");

      PrayertimeModel prayertimeModel =
          PrayertimeModel.fromJson(response.data['data']);

      return prayertimeModel;
    } on DioException catch (e) {
      String error =
          e.response?.data['data'] ?? "Oops there was an error, try later";
      throw Exception(error);
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }
}
