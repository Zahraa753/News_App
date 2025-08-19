import 'package:flutter/material.dart';

class themes {
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    brightness: Brightness.light,
    primaryColor: Colors.black,
    hintColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    hintColor: Colors.grey,
    scaffoldBackgroundColor: Colors.black,
  );
}
