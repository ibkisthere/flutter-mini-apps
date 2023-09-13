import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_todo_app/TodoProvider.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({super.key});
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return task.allTasks.isEmpty ? Center(
      child: Text("No tasks available"),
    ) :  ListView.builder(
            itemCount: task.allTasks.length,
            itemBuilder: (((context, index) => ListTile(
                  leading: Checkbox(
                    value: task.allTasks[index].completed,
                    onChanged: ((_) => task.toggleTask(task.allTasks[index])),
                  ),
                  title: Text(task.allTasks[index].todoTitle),
                  trailing: IconButton(
                      onPressed: () {
                        task.deleteTask(task.allTasks[index]);
                      },
                      icon: Icon(Icons.delete)),
                ))));
  }
}
