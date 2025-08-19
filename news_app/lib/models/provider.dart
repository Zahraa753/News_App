import 'package:flutter/material.dart';
import 'package:news_app/Local_storage/local.dart';
import 'package:news_app/cores/styles/themes.dart';

class ThemeProvider extends ChangeNotifier {
  void toggleTheme(bool isDarkMode) {
    sharedPreferences prefs = sharedPreferences();
    prefs.isDarkMode = !prefs.isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    sharedPreferences prefs = sharedPreferences();
    return prefs.isDarkMode ? themes.darkTheme : themes.lightTheme;
  }
}
