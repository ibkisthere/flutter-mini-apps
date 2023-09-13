import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../src/validation/signup_validation.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

  final validationService = Provider.of(context);
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "First Name",
                errorText: validationService 
            ))
          ],
        ),
      ),
    );
  }
}
