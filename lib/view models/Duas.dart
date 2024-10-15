import 'package:dio/dio.dart';

import 'package:quran_app/models/Duas.dart';
import 'package:quran_app/service/Duas.dart';

class DuasViewModel {
  Future<List<DuasModel>> fetchListdata() async {
    List<DuasModel> service = await DuasService(Dio()).getListDouas();
    return service;
  }
}
