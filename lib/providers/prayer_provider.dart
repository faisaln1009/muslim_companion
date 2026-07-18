import 'package:flutter/material.dart';

import '../data/models/prayer_model.dart';
import '../data/repository/prayer_repository.dart';
import '../services/location_service.dart';


class PrayerProvider extends ChangeNotifier {

  final PrayerRepository _repository = PrayerRepository();

  final LocationService _locationService = LocationService();


  PrayerModel? prayerModel;

  bool isLoading = false;


  // Prayer time load
  Future<void> loadPrayerTimes() async {

    try {

      isLoading = true;
      notifyListeners();


      // Get current location
      final position =
      await _locationService.getCurrentLocation();


      // Fetch prayer time using latitude longitude
      prayerModel =
      await _repository.getPrayerTimes(

        latitude: position.latitude,

        longitude: position.longitude,

      );


    } catch (e) {

      debugPrint(
        "Prayer Error: $e",
      );

    }


    isLoading = false;
    notifyListeners();

  }

}