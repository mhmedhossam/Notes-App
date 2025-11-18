import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_elevated_button.dart';

class EditNoteView extends StatefulWidget {
  final VoidCallback toggleDark;
  final NoteModel noteView;
  const EditNoteView({
    super.key,
    required this.toggleDark,
    required this.noteView,
  });

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String title = "";
  String subtitle = "";
  bool absorbing = true;
  @override
  Widget build(BuildContext context) {
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
                    Text("  Note", style: TextStyles.textStyle26.copyWith()),
                    Gap(20),
                    TextField(
                      onChanged: (value) {
                        title = value;

                        absorbing = title.isEmpty || subtitle.isEmpty;
                        setState(() {});
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: widget.noteView.title,
                      ),
                    ),
                    Gap(20),
                    TextField(
                      maxLines: 5,
                      maxLength: 100,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        subtitle = value;
                        absorbing = title.isEmpty || subtitle.isEmpty;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: widget.noteView.subTitle,
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: absorbing,

                            child: CustomElevatedButton(
                              buttonText: "Edit",
                              onPressed: () {
                                if (title.isNotEmpty && subtitle.isNotEmpty) {
                                  // widget.noteView.title = title;
                                  // widget.noteView.subTitle = subtitle;
                                  // Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
