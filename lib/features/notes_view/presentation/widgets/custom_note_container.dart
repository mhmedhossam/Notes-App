import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/view/edit_note_view.dart';

class CustomNoteContainer extends StatelessWidget {
  final NoteModel noteModel;
  final VoidCallback toggleDark;

  const CustomNoteContainer({
    super.key,
    required this.noteModel,
    required this.toggleDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(toggleDark: toggleDark, noteModel: noteModel);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 16),

        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.trash,
                  size: 26,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  noteModel.subTitle,
                  softWrap: true,
                  style: TextStyles.textStyle18.copyWith(
                    color: const Color.fromARGB(77, 0, 0, 0),
                  ),
                ),
              ),
              title: Text(
                noteModel.title,
                style: TextStyles.textStyle26.copyWith(color: Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                noteModel.date,
                style: TextStyles.textStyle16.copyWith(
                  color: const Color.fromARGB(122, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
