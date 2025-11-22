import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_text_field.dart';

import '../widgets/custom_color_edit_list_builder.dart';

class EditNoteView extends StatefulWidget {
  final VoidCallback toggleDark;
  final NoteModel noteModel;
  const EditNoteView({
    super.key,
    required this.toggleDark,
    required this.noteModel,
  });

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotesCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(toggleDark: widget.toggleDark, title: "Edit Note"),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(" my Note", style: TextStyles.textStyle26.copyWith()),
                    Gap(20),
                    CustomTextField(
                      hintText: widget.noteModel.title,

                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    Gap(20),
                    CustomTextField(
                      hintText: widget.noteModel.subTitle,
                      onChanged: (value) {
                        subtitle = value;
                      },

                      maxLine: 5,

                      keyboardType: TextInputType.multiline,
                    ),

                    Gap(20),

                    CustomColorEditListBuilder(noteModel: widget.noteModel),
                    Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            isLoading: false,
                            buttonText: "Edit",
                            onPressed: () {
                              widget.noteModel.title =
                                  (title != null && title!.isNotEmpty
                                  ? title
                                  : widget.noteModel.title)!;
                              widget.noteModel.subTitle =
                                  (subtitle != null && subtitle!.isNotEmpty
                                  ? subtitle
                                  : widget.noteModel.subTitle)!;
                              widget.noteModel.color = cubit.color;
                              widget.noteModel.save();
                              cubit.fetchAllNotes();

                              Navigator.pop(context);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
