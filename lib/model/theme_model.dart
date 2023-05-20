import 'package:flutter/foundation.dart';

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeModel(bool isDarkMode) {
    _isDarkMode = isDarkMode;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}