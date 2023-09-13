import 'package:flutter/material.dart';
import 'package:textfield_validation/TextSubmitWidget.dart';

//https://codewithandrea.com/articles/flutter-text-field-form-validation/
// https://medium.com/@yshean/validating-custom-textformfields-the-flutter-way-182a7bb915a2


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  void submit(String srg) {
  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
       visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:Scaffold(
        body: TextSubmitWidget(onSubmit:submit ),
        appBar: AppBar(title: Text('Validation')),
      )
    );
  }
}
