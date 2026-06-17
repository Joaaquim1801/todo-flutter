import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/injection_container.dart';
import 'package:todo/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:todo/features/tasks/presentation/colors/app_colors.dart';
import 'package:todo/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:todo/features/tasks/presentation/pages/task_page.dart';

void main() {
  seteupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TaskCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskPage(),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          colorScheme: ColorScheme.dark(
            primary: AppColors.primary,
            surface: AppColors.card,
            onPrimary: AppColors.primaryForeground,
            onSurface: AppColors.foreground,
          ),
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      ),
    );
  }
}
