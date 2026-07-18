import 'package:dio/dio.dart';

import '../../models/quran_model.dart';

class QuranApiService {
  final Dio _dio = Dio();

  // Fetch all surahs
  Future<List<QuranModel>> getSurahs() async {
    final response =
    await _dio.get("https://api.alquran.cloud/v1/surah");

    final List data = response.data["data"];

    return data
        .map((e) => QuranModel.fromJson(e))
        .toList();
  }
}