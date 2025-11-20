import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notesstates.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_note_container.dart';

class NoteListViewBuild extends StatelessWidget {
  const NoteListViewBuild({super.key, required this.toggleDark});

  final VoidCallback toggleDark;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotesCubit>();
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),

            child: cubit.notesList != []
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cubit.notesList.length,
                    itemBuilder: (context, i) {
                      return CustomNoteContainer(
                        noteModel: cubit.notesList[i],
                        toggleDark: toggleDark,
                      );
                    },
                  )
                : Icon(Icons.no_adult_content_sharp),
          ),
        );
      },
    );
  }
}
