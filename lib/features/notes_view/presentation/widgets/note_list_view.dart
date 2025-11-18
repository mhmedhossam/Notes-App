import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/view/edit_note_view.dart';

import 'custom_note_container.dart';

class NoteListViewbuild extends StatefulWidget {
  const NoteListViewbuild({
    super.key,
    required this.listNoteModel,
    required this.colors,
    required this.toggleDark,
  });

  final List<NoteModel> listNoteModel;
  final VoidCallback toggleDark;

  final List<Color> colors;

  @override
  State<NoteListViewbuild> createState() => _NoteListViewbuildState();
}

class _NoteListViewbuildState extends State<NoteListViewbuild> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.listNoteModel.length,
          itemBuilder: (context, i) {
            return CustomNoteContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditNoteView(
                        toggleDark: widget.toggleDark,
                        noteView: widget.listNoteModel[i],
                      );
                    },
                  ),
                ).then((_) {
                  setState(() {});
                });
              },
              onDelete: () {
                widget.listNoteModel.removeAt(i);
                setState(() {});
              },
              noteModel: widget.listNoteModel[i],
              color: widget.colors[i % widget.colors.length],
            );
          },
        ),
      ),
    );
  }
}
