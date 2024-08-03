import 'package:dio/dio.dart';
import 'package:quran/models/Azkar.dart';

class AzkarService {
  final Dio dio;

  AzkarService(this.dio);

  Future<List<AzkarModel>> getListAzkar() async {
    try {
      Response response =
          await dio.get("https://www.hisnmuslim.com/api/ar/husn_ar.json");

      List<dynamic> responsedata = response.data['العربية'];
      List<AzkarModel> Listdata = [];
      for (var element in responsedata) {
        Listdata.add(AzkarModel(TITLE: element['TITLE'], ID: element['ID']));
      }
      return Listdata;
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }

  Future<List<Contant>> getAzkar(int id, String zekr) async {
    try {
      Response response =
          await dio.get("https://www.hisnmuslim.com/api/ar/$id.json");

      List<dynamic> responsedata = response.data['$zekr'];
      List<Contant> Listdata = [];
      for (var element in responsedata) {
        Listdata.add(
          Contant(
            ARABIC_TEXT: element['ARABIC_TEXT'],
            REPEAT: element['REPEAT'],
          ),
        );
      }
      return Listdata;
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }
}
