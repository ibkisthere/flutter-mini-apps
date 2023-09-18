import 'package:flutter/material.dart';
import 'database_helper.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLITE Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _insert, child: Text('insert')),
            ElevatedButton(onPressed: _update, child: Text('update')),
            ElevatedButton(onPressed: _query, child: Text('query')),
            ElevatedButton(onPressed: _delete, child: Text('delete')),
          ],
        ),
      ),
    );
  }
void _insert() async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnName: 'Bob',
    DatabaseHelper.columnAge: 23
  };
  final id = await dbHelper.insert(row);
  debugPrint('inserted row id: $id');
}

void _query() async {
  final allRows = await dbHelper.queryAllRows();
  debugPrint('query all rows');
  for (final row in allRows) {
    debugPrint(row.toString());
  }
}

void _update() async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnId: 1,
    DatabaseHelper.columnName: 'Mary',
    DatabaseHelper.columnAge: 32,
  };
  final rowsAffected = await dbHelper.update(row);
  debugPrint('updated $rowsAffected row(s)');
}

void _delete() async {
  //Assuming the number of rows is the id for the last row
  final id = await dbHelper.queryRowCount();
  final rowsDeleted = await dbHelper.delete(id);
  debugPrint('deleted $rowsDeleted row(s) ; row $id');
}
}

