class AddNoteStates {}

class AddInitialState extends AddNoteStates {}

class AddSucceedState extends AddNoteStates {}

class AddloadingState extends AddNoteStates {}

class AddFailureState extends AddNoteStates {
  final String errorMessage;
  AddFailureState(this.errorMessage);
}
