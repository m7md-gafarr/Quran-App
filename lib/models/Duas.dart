class DuasModel {
  final String arab;
  DuasModel({
    required this.arab,
  });

  factory DuasModel.fromjson(json) {
    return DuasModel(
      arab: json['arab'],
    );
  }
}
