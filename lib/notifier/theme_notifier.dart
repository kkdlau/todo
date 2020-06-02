import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { LIGHT, DARK }

final List<ThemeData> themeData = [
  ThemeData(
      fontFamily: GoogleFonts.cairo().fontFamily,
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      accentColor: Colors.orangeAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity),
  ThemeData(
      fontFamily: GoogleFonts.cairo().fontFamily,
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      accentColor: Colors.orangeAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity)
];

class ThemeNotifier with ChangeNotifier {
  AppTheme _themeType;

  ThemeNotifier(AppTheme _theme) {
    _themeType = _theme;
  }

  void updateTheme(AppTheme _theme) {
    _themeType = _theme;
    this.notifyListeners();
  }

  void swapTheme() {
    _themeType = _themeType == AppTheme.LIGHT ? AppTheme.DARK : AppTheme.LIGHT;
    this.notifyListeners();
  }

  get theme => _themeType == AppTheme.LIGHT ? themeData[0] : themeData[1];
}
