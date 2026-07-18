import 'package:flutter/material.dart';

import '../data/models/ayah_model.dart';
import '../data/repository/surah_repository.dart';

class SurahProvider extends ChangeNotifier {
  final SurahRepository _repository = SurahRepository();

  List<AyahModel> ayahs = [];

  bool isLoading = false;

  // Load ayahs
  Future<void> loadAyahs(int surahNumber) async {

    isLoading = true;
    notifyListeners();

    try {

      ayahs = await _repository.getAyahs(surahNumber);

      // Debug
      debugPrint("Loaded Ayahs: ${ayahs.length}");

    } catch (e) {

      debugPrint("Ayah Error: $e");

    }

    isLoading = false;
    notifyListeners();
  }
}