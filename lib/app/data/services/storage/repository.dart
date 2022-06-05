import 'package:getx_todo_list/app/data/providers/task/provider.dart';

import '../../models/task.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTask() => taskProvider.readyTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}