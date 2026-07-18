import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/models/mosque_jamaat_model.dart';

class JamaatProvider extends ChangeNotifier {
  final Box<MosqueJamaatModel> box =
  Hive.box<MosqueJamaatModel>('jamaatBox');

  List<MosqueJamaatModel> jamaats = [];

  JamaatProvider() {
    loadJamaats();
  }

  void loadJamaats() {
    jamaats = box.values.toList();
    notifyListeners();
  }

  Future<void> addJamaat(MosqueJamaatModel jamaat) async {
    await box.add(jamaat);
    loadJamaats();
  }

  Future<void> deleteJamaat(int index) async {
    await box.deleteAt(index);
    loadJamaats();
  }

  Future<void> updateJamaat(
      int index,
      MosqueJamaatModel jamaat,
      ) async {
    await box.putAt(index, jamaat);

    jamaats[index] = jamaat;

    notifyListeners();
  }
}