import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  final Box _box = Hive.box("settings");
  static const String _keyDarkMode = "isDarkMode";

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = _box.get(_keyDarkMode, defaultValue: false);
  }

  void toggleTheme(bool value) {
    _isDark = value;
    _box.put(_keyDarkMode, value);
    notifyListeners();
  }

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
}
