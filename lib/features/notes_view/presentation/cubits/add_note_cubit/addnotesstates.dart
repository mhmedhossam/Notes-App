class AddNoteStates {}

class AddNoteInitialState extends AddNoteStates {}

class AddSucceedState extends AddNoteStates {}

class AddLoadingState extends AddNoteStates {}

class AddFailureState extends AddNoteStates {
  final String errorMessage;
  AddFailureState(this.errorMessage);
}
