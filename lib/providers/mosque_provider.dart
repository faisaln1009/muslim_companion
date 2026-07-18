import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../data/models/mosque_model.dart';
import '../data/repository/mosque_repository.dart';

class MosqueProvider extends ChangeNotifier {
  final MosqueRepository _repository = MosqueRepository();
  List<MosqueModel> mosques = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadNearbyMosques() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. Check permissions and get location
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw "Location services are disabled.";
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw "Location permissions are denied.";
        }
      }

      Position position = await Geolocator.getCurrentPosition();

      // 2. Fetch from API
      List<MosqueModel> fetchedMosques = await _repository.getNearbyMosques(
        position.latitude,
        position.longitude,
      );

      // 3. Calculate Distance
      for (var mosque in fetchedMosques) {
        mosque.distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          mosque.latitude,
          mosque.longitude,
        ) / 1000;
      }

      // 4. Sort by distance
      fetchedMosques.sort((a, b) => a.distance.compareTo(b.distance));
      mosques = fetchedMosques;

    } catch (e) {
      errorMessage = e.toString();
      debugPrint("Provider Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
