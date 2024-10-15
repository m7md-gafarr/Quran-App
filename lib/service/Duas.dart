import 'package:dio/dio.dart';
import 'package:quran_app/models/Azkar.dart';

import '../models/Duas.dart';

class DuasService {
  final Dio dio;

  DuasService(this.dio);

  Future<List<DuasModel>> getListDouas() async {
    try {
      Response response = await dio.get(
          "https://hadis-api-id.vercel.app/hadith/abu-dawud?page=1&limit=1000");

      List<dynamic> responsedata = response.data['items'];
      List<DuasModel> Listdata = [];
      for (var element in responsedata) {
        Listdata.add(DuasModel.fromjson(element));
      }
      return Listdata;
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }
}
