import 'package:todo/features/tasks/domain/entitties/task.dart';
import 'package:todo/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  void addTask(Task newTask) {
    _tasks.add(newTask);
  }

  @override
  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  @override
  List<Task> getTasks() {
    return _tasks;
  }
}
