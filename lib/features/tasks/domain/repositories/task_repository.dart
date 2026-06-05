import 'package:todo/features/tasks/domain/entitties/task.dart';

abstract class TaskRepository {
  void addTask(Task newTask);
  void deleteTask(int id);
  List<Task> getTasks();
}
