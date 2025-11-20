import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotescubit.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotesstates.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_text_field.dart';

import 'custom_color_list_view_builder.dart';

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
    var cubit = context.read<AddNoteCubit>();

    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" Enter your Note", style: TextStyles.textStyle26.copyWith()),
          Gap(20),
          CustomTextField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "this field is required";
              }
              return null;
            },
            onSaved: (value) {
              title = value;
            },
            hintText: "enter your note",

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
            maxLine: 5,

            keyboardType: TextInputType.multiline,
          ),
          Gap(20),

          CustomColorListViewBuilder(cubit: cubit),
          Gap(20),

          Row(
            children: [
              Expanded(
                child: BlocBuilder<AddNoteCubit, AddNoteStates>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state is AddLoadingState ? true : false,
                      buttonText: "Add",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var noteModel = NoteModel(
                            title: title!,
                            color: 0,
                            subTitle: subTitle!,

                            date: DateFormat(
                              'yyyy-MM-dd',
                            ).format(DateTime.now()),
                          );
                          cubit.addNote(noteModel);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ),
              Gap(20),
              Expanded(
                child: CustomElevatedButton(
                  isLoading: false,
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
