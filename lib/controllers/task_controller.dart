import 'package:get/get.dart';
import 'package:todo_app/database/database_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DatabaseHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DatabaseHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DatabaseHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DatabaseHelper.update(id);
    getTasks();
  }
}
