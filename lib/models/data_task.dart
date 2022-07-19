import 'package:crud_task_pruebas/models/task.dart';
import 'package:crud_task_pruebas/services/data_base_services.dart';
import 'package:flutter/cupertino.dart';

class DataTask extends ChangeNotifier {
  List<Task> tasks = [];

  void addTasks(String title) async {
    Task task = await DatabaseServices.addTasks(title);
    tasks.add(task);
    notifyListeners();
  }
}
