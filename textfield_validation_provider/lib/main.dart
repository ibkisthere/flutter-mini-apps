import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textfield_validation_provider/screens/Signup.dart';
import 'package:textfield_validation_provider/src/validation/signup_validation.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpValidation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: Signup(),
      ),
    );
  }
}


