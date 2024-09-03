import 'package:flutter/material.dart';
import 'package:mirko/models/themes.dart';
import 'package:mirko/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const IntroPage(),
    );
  }
}
