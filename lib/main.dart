import 'package:flutter/material.dart';
// import 'package:mirko/pages/homepage.dart';
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}
