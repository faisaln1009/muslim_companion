import 'package:dio/dio.dart';

import '../../models/prayer_model.dart';

class PrayerApiService {

  final Dio _dio = Dio();


  Future<PrayerModel> getPrayerTimes({
    required double latitude,
    required double longitude,
  }) async {


    final response = await _dio.get(
      "https://api.aladhan.com/v1/timings",
      queryParameters: {

        "latitude": latitude,
        "longitude": longitude,

      },
    );


    return PrayerModel.fromJson(
      response.data["data"]["timings"],
    );
  }
}