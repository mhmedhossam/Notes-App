import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/app_colors.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';

import 'custom_elevated_button.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key, required this.tempNote});

  final NoteModel tempNote;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                " Enter your Note",
                style: Textstyles.textStyle26.copyWith(),
              ),
              Gap(20),
              TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // tempNote.title = value;
                  }
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(hintText: "enter your note"),
              ),
              Gap(20),
              TextField(
                maxLines: 5,
                maxLength: 100,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // tempNote.subTitle = value;
                  }
                },
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: "describtion",
                ),
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: "Add",
                      onPressed: () {
                        Navigator.pop(context, tempNote);
                      },
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: "close",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
