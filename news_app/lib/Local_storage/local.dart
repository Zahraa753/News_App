import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferences {
  bool isDarkMode = false;
  sharedPreferences item = sharedPreferences();

  static void saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  void loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
  }
}
