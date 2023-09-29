import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_todo_app/TodoProvider.dart';
import 'package:simple_provider_todo_app/screens/Todoaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose(); 
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add a new task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Add new task"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(minimumSize: Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddTextDialog();
        }),
        child: Icon(Icons.add),
        tooltip: "Add a todo",
      ),
    );
  }
}
