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
    return List.from(_tasks);
  }

  @override
  void toggleTask(int id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    Task newTask = Task(task.id, task.title, !task.isCompleted);
    _tasks[_tasks.indexOf(task)] = newTask;
  }
}
