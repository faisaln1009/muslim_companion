import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/mosque_model.dart';

class MosqueApiService {
  final Dio _dio = Dio();

  Future<List<MosqueModel>> getNearbyMosques(double lat, double lng) async {
    final query = """
    [out:json][timeout:25];
    (
      node["amenity"="place_of_worship"]["religion"="muslim"](around:10000,$lat,$lng);
      way["amenity"="place_of_worship"]["religion"="muslim"](around:10000,$lat,$lng);
      relation["amenity"="place_of_worship"]["religion"="muslim"](around:10000,$lat,$lng);
    );
    out center;
    """;

    try {
      final response = await _dio.post(
        "https://overpass-api.de/api/interpreter",
        data: query,
        options: Options(
          headers: {
            "Content-Type": "text/plain",
            "User-Agent": "MuslimCompanionApp/1.0",
          },
        ),
      );

      if (response.statusCode == 200) {
        final List elements = response.data["elements"] ?? [];
        return elements.map((e) => MosqueModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      debugPrint("API Request Failed: $e");
      return [];
    }
  }
}
