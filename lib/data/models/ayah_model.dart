class AyahModel {
  final int number;
  final String arabic;
  final String english;

  AyahModel({
    required this.number,
    required this.arabic,
    required this.english,
  });

  // API -> Model
  factory AyahModel.fromJson(
      Map<String, dynamic> arabicJson,
      Map<String, dynamic> englishJson,
      ) {
    return AyahModel(
      number: arabicJson["numberInSurah"],
      arabic: arabicJson["text"],
      english: englishJson["text"],
    );
  }
}