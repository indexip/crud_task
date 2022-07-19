import 'package:crud_task_pruebas/models/data_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  String titleTask = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(children: [
        const Text('Add Task'),
        TextField(
          onChanged: (value) {
            titleTask = value;
          },
        ),
        TextButton(
            onPressed: () {
              if (titleTask.isNotEmpty) {
                Provider.of<DataTask>(context, listen: false)
                    .addTasks(titleTask);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'))
      ]),
    );
  }
}
