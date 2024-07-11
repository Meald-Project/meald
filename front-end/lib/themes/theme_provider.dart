import 'package:flutter/material.dart';
import 'light_mode.dart';
import 'dark_mode.dart';

enum ThemeType {Light,Dark}

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightMode;
  ThemeType _currentThemeType = ThemeType.Light;

  ThemeData get currentTheme => _currentTheme;
  ThemeType get currentThemeType => _currentThemeType;

  void toggleTheme() {
    if (_currentThemeType == ThemeType.Light) {
      _currentTheme = darkMode;
      _currentThemeType = ThemeType.Dark;
    } else {
      _currentTheme = lightMode;
      _currentThemeType = ThemeType.Light;
    }
    notifyListeners();
  }
}