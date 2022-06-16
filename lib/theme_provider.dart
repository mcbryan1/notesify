import 'package:flutter/material.dart';
import 'package:notesify/constants/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppStyle.primaryColor,
      colorScheme: const ColorScheme.dark());

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light());
}
