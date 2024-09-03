import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xfff5f5f5),
    primary: Color(0xffF2E3D5),
    secondary: Color(0xff796878),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Color(0xff4A4A4A),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff28282B),
    primary: Color(0xfff5f5f5),
    secondary: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xfff5f5f5),
      fontFamily: 'Roboto',
      fontSize: 24.0,
    ),
  ),
);
