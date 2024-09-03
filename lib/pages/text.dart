import 'package:flutter/material.dart';

class TextModel {
  static TextStyle heading = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color(0xff4A4A4A),
  );

  static TextStyle chat = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle light = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xff4A4A4A),
  );

  static TextStyle hint = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: const Color(0xff4A4A4A).withOpacity(0.5),
  );
}
