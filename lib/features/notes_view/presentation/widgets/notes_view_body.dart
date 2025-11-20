import 'package:flutter/material.dart';

import 'package:notes_app/features/notes_view/presentation/widgets/custom_app_bar.dart';

import 'note_list_view.dart';

class NotesViewBody extends StatelessWidget {
  final VoidCallback toggleDark;

  const NotesViewBody({super.key, required this.toggleDark});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Column(
          children: [
            CustomAppBar(toggleDark: toggleDark, title: "Notes"),

            NoteListViewBuild(toggleDark: toggleDark),
          ],
        ),
      ),
    );
  }
}
