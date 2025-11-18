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
  final List<NoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(toggleDark: widget.toggleDark, noteview: notes),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () async {
          // NoteModel tempNote = NoteModel(
          //   title: '',
          //   subTitle: '',
          //   onTap: () {},
          //   date:
          //       "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          // );
          final result = await showModalBottomSheet<NoteModel>(
            context: context,
            builder: (context) {
              return AddNoteButtonSheet();
            },
          );
          if (result != null) {
            setState(() {});
            notes.add(result);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
