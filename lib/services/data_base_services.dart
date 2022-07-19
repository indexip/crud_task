import 'package:crud_task_pruebas/models/task.dart';
import 'package:crud_task_pruebas/services/glogal.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseServices {
  //Metodo para insertar un registro
  static Future<Task> addTasks(String title) async {
    Map data = {'title': title};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/add');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Task task = Task.fromMap(responseMap);

    return task;
  }

  //Metodo para obtener los registros

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(url, headers: headers);
    print(response.body);

    List responseList = jsonDecode(response.body);
    List<Task> tasks = [];
    for (Map responseMap in responseList) {
      Task task = Task.fromMap(responseMap);
      tasks.add(task);
    }
    return tasks;
  }
}
