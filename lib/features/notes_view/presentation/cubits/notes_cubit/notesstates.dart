class NotesStates {}

class NoteInitialState extends NotesStates {}

class NoteSucceedState extends NotesStates {}

class NoteLoadingState extends NotesStates {}

class NoteFailureState extends NotesStates {
  final String errorMessage;
  NoteFailureState(this.errorMessage);
}
