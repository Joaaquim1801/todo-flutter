import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/tasks/presentation/colors/app_colors.dart';
import 'package:todo/features/tasks/domain/entitties/task.dart';
import 'package:todo/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:todo/features/tasks/presentation/cubit/task_states.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final date = DateFormat(
      "EEEE, d \'OF\' MMMM'",
    ).format(DateTime.now()).toUpperCase();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 128),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.checklist_rounded, color: c.primary),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.auto_awesome,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  "$date",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.4,
                    color: AppColors.mutedForeground,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Hey there,",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "let's get it done",
                  style: GoogleFonts.sora(
                    textStyle: TextStyle(color: c.primary),
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    fontSize: 30,
                  ),
                ),
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Text("Iniciou"),
                      loaded: (taskList) {
                        final concluidas = taskList
                            .where((task) => task.isCompleted)
                            .length;
                        final total = taskList.length;
                        final progresso = total == 0 ? 0.0 : concluidas / total;

                        return Column(
                          children: [
                            SizedBox(height: 28),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.card,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          value: progresso,
                                          strokeWidth: 8,
                                          strokeCap: StrokeCap.round,
                                          backgroundColor: AppColors.secondary,
                                          valueColor: AlwaysStoppedAnimation(
                                            c.primary,
                                          ),
                                          constraints: BoxConstraints(
                                            minHeight: 60,
                                            minWidth: 60,
                                          ),
                                        ),
                                        Text(
                                          "${(progresso * 100).toStringAsFixed(0)}%",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.foreground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Progress today",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.mutedForeground,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "${concluidas} / ${total}",
                                        style: GoogleFonts.sora(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.foreground,
                                        ),
                                      ),
                                      Text(
                                        "${total - concluidas} tasks left",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.mutedForeground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 28),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My tasks",
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.foreground,
                                  ),
                                ),
                                Text(
                                  "${taskList.length} total",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mutedForeground,
                                  ),
                                ),
                              ],
                            ),

                            ListView.builder(
                              itemCount: taskList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final task = taskList[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.read<TaskCubit>().toggleTask(
                                            task.id,
                                          );
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: task.isCompleted
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: task.isCompleted
                                                  ? AppColors.primary
                                                  : AppColors.mutedForeground,
                                              width: 2,
                                            ),
                                          ),
                                          child: task.isCompleted
                                              ? Icon(
                                                  Icons.check,
                                                  size: 14,
                                                  color: AppColors
                                                      .primaryForeground,
                                                )
                                              : null,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          task.title,
                                          style: TextStyle(
                                            fontSize: 14,
                                            decoration: task.isCompleted
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            decorationColor:
                                                AppColors.mutedForeground,
                                            fontWeight: FontWeight.w500,
                                            color: task.isCompleted
                                                ? AppColors.mutedForeground
                                                : AppColors.foreground,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.edit_outlined,
                                        size: 18,
                                        color: AppColors.mutedForeground,
                                      ),
                                      SizedBox(width: 8),
                                      IconButton(
                                        onPressed: () {
                                          context.read<TaskCubit>().deleteTask(
                                            task.id,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete_outlined,
                                          color: AppColors.mutedForeground,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 32),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.mutedForeground,
                              ),
                              decoration: InputDecoration(
                                hintText: "Add a new task...",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.mutedForeground,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_controller.text.isEmpty) return;
                              context.read<TaskCubit>().addTask(
                                Task(
                                  DateTime.now().millisecondsSinceEpoch,
                                  _controller.text,
                                  false,
                                ),
                              );
                              _controller.clear();
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              fixedSize: Size(44, 44),
                            ),
                            icon: Icon(
                              Icons.add,
                              color: AppColors.primaryForeground,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
