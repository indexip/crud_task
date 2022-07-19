import 'package:crud_task_pruebas/models/data_task.dart';
import 'package:crud_task_pruebas/models/task.dart';
import 'package:crud_task_pruebas/screens/add_task_screen.dart';
import 'package:crud_task_pruebas/services/data_base_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  getTasks() async {
    tasks = await DatabaseServices.getTasks();
    Provider.of<DataTask>(context, listen: false).tasks = tasks;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
      ),
      body: Consumer<DataTask>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value.tasks[index].title),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddTaskScreen());
          }),
    );
  }
}
