import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notesstates.dart';

class NotesCubit extends Cubit<NotesStates> {
  List<NoteModel> notesList = [];
  int? color;
  NotesCubit() : super(NoteInitialState());

  void resetColor() {
    color = null;
  }

  Future<void> fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notesList = noteBox.values.toList();

    emit(NoteSucceedState());
  }
}
