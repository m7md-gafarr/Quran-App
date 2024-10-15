import 'package:dio/dio.dart';

import 'package:quran_app/models/Quran.dart';
import 'package:quran_app/service/Quran.dart';

class QuranViewModel {
  Future<List<QuransurahModel>> fetchListSurah() async {
    List<QuransurahModel> service =
        await QuranService(Dio()).GetListQuranSurah();
    return service;
  }

  Future<List<QuranJuzModel>> fetchListJuz() async {
    List<QuranJuzModel> service = await QuranService(Dio()).GetListQuranJuz();
    return service;
  }
}
