import 'package:flutter/material.dart';

import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_app_bar.dart';

import 'note_list_view.dart';

class NotesViewBody extends StatelessWidget {
  final VoidCallback toggleDark;
  final List<Color> colors = [
    Colors.amber,
    Colors.lightBlue,
    Colors.purpleAccent,
    Colors.greenAccent,
  ];
  final List<NoteModel> noteview;

  NotesViewBody({super.key, required this.toggleDark, required this.noteview});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Column(
          children: [
            CustomAppBar(toggleDark: toggleDark, title: "Notes"),

            NoteListViewbuild(
              listNoteModel: noteview,
              colors: colors,
              toggleDark: toggleDark,
            ),
          ],
        ),
      ),
    );
  }
}
