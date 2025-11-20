import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotescubit.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotesstates.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';

import 'add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) async {
            if (state is AddSucceedState) {
              await context.read<NotesCubit>().fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddLoadingState ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: AddNoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
