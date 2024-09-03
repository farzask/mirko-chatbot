import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xfff5f5f5),
    primary: Color(0xffF2E3D5),
    secondary: Color(0xff796878),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xff4A4A4A),
      fontFamily: 'Roboto',
      fontSize: 24.0,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff28282B),
    primary: Colors.white,
    secondary: Color(0xfff5f5f5),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xfff5f5f5),
      fontFamily: 'Roboto',
      fontSize: 22.0,
    ),
  ),
);
