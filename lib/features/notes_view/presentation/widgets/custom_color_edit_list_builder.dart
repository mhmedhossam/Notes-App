import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/widgets/custom_circle_avatar.dart';

class CustomColorEditListBuilder extends StatefulWidget {
  final NoteModel noteModel;
  const CustomColorEditListBuilder({super.key, required this.noteModel});

  @override
  State<CustomColorEditListBuilder> createState() =>
      _CustomColorEditListBuilderState();
}

class _CustomColorEditListBuilderState
    extends State<CustomColorEditListBuilder> {
  @override
  void initState() {
    selectedColor = colors.indexOf(widget.noteModel.color);
    super.initState();
  }

  late int selectedColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return CustomCircleAvatar(
            color: colors[i],
            isActive: selectedColor == i,
            onTap: () {
              selectedColor = i;
              setState(() {});
              context.read<NotesCubit>().color = colors[i];
            },
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}
