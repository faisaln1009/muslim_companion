import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/favorite_model.dart';

class FavoriteProvider extends ChangeNotifier {

  final Box box = Hive.box("favorites");

  List<FavoriteModel> favorites = [];

  // Load saved favorites
  void loadFavorites() {

    favorites = box.values
        .map(
          (e) => FavoriteModel.fromMap(
        Map<String, dynamic>.from(e),
      ),
    )
        .toList();

    notifyListeners();
  }

  // Add favorite
  void addFavorite(
      FavoriteModel favorite,
      ) {

    box.add(
      favorite.toMap(),
    );

    loadFavorites();
  }

  // Delete favorite
  void deleteFavorite(
      int index,
      ) {

    box.deleteAt(index);

    loadFavorites();
  }
}
