import 'package:dio/dio.dart';
import 'package:quran/models/Duas.dart';
import 'package:quran/service/Duas.dart';

class DuasViewModel {
  Future<List<DuasModel>> fetchListdata() async {
    List<DuasModel> service = await DuasService(Dio()).getListDouas();
    return service;
  }
}
