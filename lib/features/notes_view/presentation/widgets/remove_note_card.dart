import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/app_colors.dart';

class RemoveNoteCard extends StatelessWidget {
  const RemoveNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.delete), Gap(10)],
      ),
    );
  }
}
