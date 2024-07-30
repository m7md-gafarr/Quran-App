class PrayertimeModel {
  final TimingsModel timing;
  final DataHijriAndGregorian data;

  PrayertimeModel({
    required this.timing,
    required this.data,
  });

  factory PrayertimeModel.fromJson(Map<String, dynamic> json) {
    return PrayertimeModel(
      timing: TimingsModel.fromJson(json['timings']),
      data: DataHijriAndGregorian.fromJson(json['date']),
    );
  }
}

class TimingsModel {
  final String Fajr;
  final String Dhuhr;
  final String Asr;
  final String Maghrib;
  final String Isha;

  TimingsModel({
    required this.Fajr,
    required this.Dhuhr,
    required this.Asr,
    required this.Maghrib,
    required this.Isha,
  });

  factory TimingsModel.fromJson(Map<String, dynamic> json) {
    return TimingsModel(
      Fajr: json['Fajr'],
      Dhuhr: json['Dhuhr'],
      Asr: json['Asr'],
      Maghrib: json['Maghrib'],
      Isha: json['Isha'],
    );
  }
}

class DataHijriAndGregorian {
  final String dayHijri;
  final String dayGregorian;
  final String dayName;
  final String year;
  final String monthHijri;
  final String monthGregorian;

  DataHijriAndGregorian({
    required this.dayHijri,
    required this.dayGregorian,
    required this.dayName,
    required this.year,
    required this.monthHijri,
    required this.monthGregorian,
  });

  factory DataHijriAndGregorian.fromJson(Map<String, dynamic> json) {
    List<String> monthArabic = [
      "يناير",
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر"
    ];
    int monthNumber = json['gregorian']['month']['number'];
    String monthArabicName = monthArabic[monthNumber - 1];

    return DataHijriAndGregorian(
      dayGregorian: json['gregorian']['day'],
      dayHijri: json['hijri']['day'],
      dayName: json['hijri']['weekday']['ar'],
      year: json['hijri']['year'],
      monthHijri: json['hijri']['month']['ar'],
      monthGregorian: monthArabicName,
    );
  }
}
