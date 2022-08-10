import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme customTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.green[300],
      primaryColorLight: Colors.green[50],
      primaryColorDark: Colors.green[600],
      backgroundColor: Colors.green[50],
      appBarTheme: AppBarTheme(color: Colors.green[300]),
      textTheme: GoogleFonts.robotoTextTheme(),
    );
  }
}
