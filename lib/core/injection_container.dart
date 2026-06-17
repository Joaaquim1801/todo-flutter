import 'package:get_it/get_it.dart';
import 'package:todo/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo/features/tasks/presentation/cubit/task_cubit.dart';

final getIt = GetIt.instance;

void seteupDependencies(){
  getIt.registerLazySingleton<TaskRepository>(()=> TaskRepositoryImpl());

  getIt.registerFactory<TaskCubit>(() => TaskCubit(getIt<TaskRepository>()));
}
