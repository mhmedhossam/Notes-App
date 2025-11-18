import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_text_field.dart';

import 'custom_elevated_button.dart';

class AddNoteButtonSheet extends StatelessWidget {
  AddNoteButtonSheet({super.key, this.tempNote});

  NoteModel? tempNote;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(child: AddNoteForm()),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" Enter your Note", style: TextStyles.textStyle26.copyWith()),
          Gap(20),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "this field is required";
              }
              return null;
            },
            controller: TextEditingController(),
            hintText: "enter your note",
            onChanged: (value) {
              if (value.isNotEmpty) {
                // tempNote.title = value;
              }
            },
            keyboardType: TextInputType.multiline,
          ),
          Gap(20),
          CustomTextField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "this field is required";
              }
              return null;
            },
            onSaved: (value) {
              subTitle = value;
            },
            hintText: "description",
            controller: TextEditingController(),
            maxLine: 5,

            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              if (value.isNotEmpty) {
                // tempNote.subTitle = value;
              }
            },
          ),
          Gap(20),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonText: "Add",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
              Gap(20),
              Expanded(
                child: CustomElevatedButton(
                  buttonText: "close",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
