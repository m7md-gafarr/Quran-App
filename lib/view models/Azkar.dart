import 'package:dio/dio.dart';
import 'package:quran/models/Azkar.dart';

import '../service/Azkar.dart';

class AzkarViewModel {
  Future<List<AzkarModel>> fetchListdata() async {
    List<AzkarModel> service = await AzkarService(Dio()).getListAzkar();
    return service;
  }

  Future<List<Contant>> fetchZkerdata(
      {required int id, required String Zker}) async {
    List<Contant> service = await AzkarService(Dio()).getAzkar(id, Zker);
    return service;
  }
}
