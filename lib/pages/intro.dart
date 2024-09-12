import 'package:flutter/material.dart';
import 'package:mirko/pages/homepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/robot.png'),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Text(
                'Welcome to your personal AI assistant',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            continueButton(context),
          ],
        ),
      ),
    );
  }

  MaterialButton continueButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
      height: 40,
      minWidth: 200,
      color: const Color(0xff796878),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Continue',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
        ),
      ),
    );
  }
}
