import 'package:flutter/material.dart';

import '../data/models/quran_model.dart';
import '../data/repository/quran_repository.dart';

class QuranProvider extends ChangeNotifier {
  final QuranRepository _repository = QuranRepository();

  List<QuranModel> surahs = [];

  bool isLoading = false;

  // Load surah list
  Future<void> loadSurahs() async {
    isLoading = true;
    notifyListeners();

    surahs = await _repository.getSurahs();

    isLoading = false;
    notifyListeners();
  }
}