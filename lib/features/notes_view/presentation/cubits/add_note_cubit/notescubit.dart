import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/notesstates.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  Future<void> addNote(NoteModel noteModel) async {
    emit(AddloadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(noteModel);

      emit(AddSucceedState());
    } catch (e) {
      emit(AddFailureState(e.toString()));
    }
  }
}
