import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_colors.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import '../widgets/add_note_button_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatefulWidget {
  final VoidCallback toggleDark;
  const NotesView({super.key, required this.toggleDark});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(toggleDark: widget.toggleDark),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          showModalBottomSheet<NoteModel>(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SafeArea(child: AddNoteButtonSheet());
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
