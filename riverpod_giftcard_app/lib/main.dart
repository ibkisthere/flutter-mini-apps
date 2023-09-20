import 'package:flutter/material.dart';
import 'package:riverpod_giftcard_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

//flutter packages pub run build_runner build - generate

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}
