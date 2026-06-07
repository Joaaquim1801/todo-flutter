import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/features/tasks/presentation/colors/app_colors.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.checklist_rounded, color: c.primary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.auto_awesome, color: c.primary),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              "SUNDAY, 7 OF JUNE",
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
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
