import 'package:flutter/material.dart';

enum AppTheme { LIGHT, DARK }

final List<ThemeData> themeData = [
  ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.lightBlueAccent),
  ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      accentColor: Colors.yellowAccent)
];

class ThemeNotifier with ChangeNotifier {
  ThemeData theme;

  ThemeNotifier(AppTheme _theme) {
    theme = _theme == AppTheme.LIGHT ? themeData[0] : themeData[1];
  }

  void updateTheme(AppTheme _theme) {
    theme = _theme == AppTheme.LIGHT ? themeData[0] : themeData[1];
    this.notifyListeners();
  }
}
