class FavoriteModel {

  final int surahNumber;
  final int ayahNumber;
  final String surahName;
  final String arabic;
  final String english;

  FavoriteModel({
    required this.surahNumber,
    required this.ayahNumber,
    required this.surahName,
    required this.arabic,
    required this.english,
  });

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      "surahNumber": surahNumber,
      "ayahNumber": ayahNumber,
      "surahName": surahName,
      "arabic": arabic,
      "english": english,
    };
  }

  // Convert Map to object
  factory FavoriteModel.fromMap(
      Map map,
      ) {
    return FavoriteModel(
      surahNumber: map["surahNumber"],
      ayahNumber: map["ayahNumber"],
      surahName: map["surahName"],
      arabic: map["arabic"],
      english: map["english"],
    );
  }
}