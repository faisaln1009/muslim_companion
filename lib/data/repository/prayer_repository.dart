import '../datasource/remote/prayer_api_service.dart';
import '../models/prayer_model.dart';

class PrayerRepository {

  final PrayerApiService _apiService = PrayerApiService();


  // API theke prayer time newar jonno
  Future<PrayerModel> getPrayerTimes({

    required double latitude,
    required double longitude,

  }) async {


    return await _apiService.getPrayerTimes(

      latitude: latitude,
      longitude: longitude,

    );

  }
}