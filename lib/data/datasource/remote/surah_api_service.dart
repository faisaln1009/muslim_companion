import 'package:dio/dio.dart';

import '../../models/ayah_model.dart';

class SurahApiService {
  final Dio _dio = Dio();

  // Fetch ayahs
  Future<List<AyahModel>> getAyahs(int surahNumber) async {

    final arabicResponse = await _dio.get(
      "https://api.alquran.cloud/v1/surah/$surahNumber",
    );

    final englishResponse = await _dio.get(
      "https://api.alquran.cloud/v1/surah/$surahNumber/en.asad",
    );

    final arabicAyahs = arabicResponse.data["data"]["ayahs"];
    final englishAyahs = englishResponse.data["data"]["ayahs"];

    List<AyahModel> list = [];

    for (int i = 0; i < arabicAyahs.length; i++) {
      list.add(
        AyahModel.fromJson(
          arabicAyahs[i],
          englishAyahs[i],
        ),
      );
    }

    return list;
  }
}