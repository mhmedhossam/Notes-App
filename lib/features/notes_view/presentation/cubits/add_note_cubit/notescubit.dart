import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/notesstates.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddInitialState());
}
