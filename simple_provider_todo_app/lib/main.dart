import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_todo_app/TodoProvider.dart';
import 'package:simple_provider_todo_app/screens/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Simple Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),
        home:MyHomePage()
      ),
    );
  }
}


