import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo/features/tasks/presentation/cubit/task_states.dart';
import 'package:todo/features/tasks/domain/entitties/task.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository _taskRepository;

  TaskCubit(this._taskRepository) : super(const TaskState.initial());

  void addTask(Task newTask) {
    _taskRepository.addTask(newTask);
    emit(TaskState.loaded(_taskRepository.getTasks()));
  }

  void deleteTask(int id) {
    _taskRepository.deleteTask(id);
    emit(TaskState.loaded(_taskRepository.getTasks()));
  }

  void getTasks() {
    emit(TaskState.loaded(_taskRepository.getTasks()));
  }

  void toggleTask(int id) {
    _taskRepository.toggleTask(id);
    emit(TaskState.loaded(_taskRepository.getTasks()));
  }
}
