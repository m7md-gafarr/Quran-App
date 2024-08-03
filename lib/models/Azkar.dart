class AzkarModel {
  final String TITLE;
  final int ID;

  AzkarModel({
    required this.TITLE,
    required this.ID,
  });
  factory AzkarModel.fromjson(json) {
    return AzkarModel(
      TITLE: json['TITLE'],
      ID: json['ID'],
    );
  }
}

class Contant {
  final String ARABIC_TEXT;
  final int REPEAT;
  Contant({
    required this.ARABIC_TEXT,
    required this.REPEAT,
  });

  factory Contant.fromjson(json) {
    return Contant(
      ARABIC_TEXT: json['ARABIC_TEXT'],
      REPEAT: json['REPEAT'],
    );
  }
}
