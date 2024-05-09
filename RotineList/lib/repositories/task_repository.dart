import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Pages/ListPage/models/TaskDescription.dart';

const taskListKey = 'Task_List';

class TaskRepository {

  late SharedPreferences sharedPreferences;

  Future<List<TaskDescription>> getTaskList() async {
      sharedPreferences = await SharedPreferences.getInstance();
      final String jsonString = sharedPreferences.getString(taskListKey) ?? '[]';
      final List jsonDecoded = json.decode(jsonString) as List;
      return jsonDecoded.map((e) => TaskDescription.fromJson(e)).toList();
    }
  
  

  void saveTaskList(List<TaskDescription> tasks) {
    final String jsonString = json.encode(tasks);
    sharedPreferences.setString(taskListKey, jsonString);
  }
}
