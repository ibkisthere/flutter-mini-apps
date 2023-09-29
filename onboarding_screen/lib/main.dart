import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

final List<String> textOpeners = [
  'HELLO',
  'WELCOME',
  'TO',
  'SYNERGY',
  'HELLO,\r\nWELCOME\r\nTO\r\nSYNERGY'
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreen()
    );
  }
}
