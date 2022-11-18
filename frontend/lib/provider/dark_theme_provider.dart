import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../shared_preferences/dark_theme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false;
  bool get getdarkThemes => _darkTheme;

  set setdarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }

  void getDarkTheme() {}
}
