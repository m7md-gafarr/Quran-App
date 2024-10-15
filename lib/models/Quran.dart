// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuransurahModel {
  final int number;
  final String name;
  final int numberOfAyahs;
  QuransurahModel({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
  });

  factory QuransurahModel.fromjson(json) {
    return QuransurahModel(
      name: json['name'],
      number: json['number'],
      numberOfAyahs: json['numberOfAyahs'],
    );
  }
}

class QuranJuzModel {
  final int juz;
  final int page;
  final String number;

  QuranJuzModel({
    required this.juz,
    required this.page,
    required this.number,
  });

  factory QuranJuzModel.fromjson(json) {
    List<String> numbersArabic = [
      "واحد",
      "اثنان",
      "ثلاثة",
      "أربعة",
      "خمسة",
      "ستة",
      "سبعة",
      "ثمانية",
      "تسعة",
      "عشرة",
      "أحد عشر",
      "اثنا عشر",
      "ثلاثة عشر",
      "أربعة عشر",
      "خمسة عشر",
      "ستة عشر",
      "سبعة عشر",
      "ثمانية عشر",
      "تسعة عشر",
      "عشرون",
      "واحد وعشرون",
      "اثنان وعشرون",
      "ثلاثة وعشرون",
      "أربعة وعشرون",
      "خمسة وعشرون",
      "ستة وعشرون",
      "سبعة وعشرون",
      "ثمانية وعشرون",
      "تسعة وعشرون",
      "ثلاثون"
    ];
    int monthNumber = json['data']['number'];
    String monthArabicName = numbersArabic[monthNumber - 1];
    return QuranJuzModel(
      number: monthArabicName,
      juz: json['data']['ayahs'][0]['juz'],
      page: json['data']['ayahs'][0]['page'],
    );
  }
}
