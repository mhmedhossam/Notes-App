import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/notesstates.dart';

import 'add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: (context, state) {
              if (state is AddSucceedState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AddLoadingState ? true : false,
                child: AddNoteForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
