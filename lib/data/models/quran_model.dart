class QuranModel {
  final int number;
  final String name;
  final String englishName;

  QuranModel({
    required this.number,
    required this.name,
    required this.englishName,
  });

  // API -> Model
  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
    );
  }
}