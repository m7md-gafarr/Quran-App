import 'package:dio/dio.dart';
import 'package:quran_app/models/Quran.dart';

class QuranService {
  final Dio dio;

  QuranService(this.dio);

  Future<List<QuransurahModel>> GetListQuranSurah() async {
    try {
      Response response = await dio.get("http://api.alquran.cloud/v1/surah");

      List<dynamic> responsedata = response.data['data'];
      List<QuransurahModel> Listdata = [];
      for (var element in responsedata) {
        Listdata.add(QuransurahModel.fromjson(element));
      }
      return Listdata;
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }

  Future<List<QuranJuzModel>> GetListQuranJuz() async {
    List<QuranJuzModel> Listdata = [];

    try {
      for (var i = 1; i < 31; i++) {
        Response response =
            await dio.get("https://api.alquran.cloud/v1/juz/$i/en.asad");

        var responsedata = response.data;

        Listdata.add(
          QuranJuzModel.fromjson(responsedata),
        );
      }

      return Listdata;
    } catch (e) {
      print(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }
}
