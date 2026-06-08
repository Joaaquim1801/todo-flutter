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
                          value: 0.25,
                          strokeWidth: 8,
                          strokeCap: StrokeCap.round,
                          backgroundColor: AppColors.secondary,
                          valueColor: AlwaysStoppedAnimation(c.primary),
                          constraints: BoxConstraints(
                            minHeight: 60,
                            minWidth: 60,
                          ),
                        ),
                        Text(
                          "25%",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        "1 / 4",
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.foreground,
                        ),
                      ),
                      Text(
                        "3 tasks left",
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
                  "4 total",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.mutedForeground,
                        width: 2,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Morning run 5km",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: AppColors.mutedForeground,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.delete_outlined,
                    size: 18,
                    color: AppColors.mutedForeground,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
