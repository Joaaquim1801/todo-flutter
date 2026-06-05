import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/features/tasks/domain/entitties/task.dart';

part 'task_states.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;
  const factory TaskState.loaded(List<Task> taskList) = _Loaded;
}
