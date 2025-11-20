import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotescubit.dart';

import 'custom_circle_avatar.dart';

class CustomColorListViewBuilder extends StatefulWidget {
  const CustomColorListViewBuilder({super.key, required this.cubit});

  final AddNoteCubit cubit;

  @override
  State<CustomColorListViewBuilder> createState() =>
      _CustomColorListViewBuilderState();
}

class _CustomColorListViewBuilderState
    extends State<CustomColorListViewBuilder> {
  int selectedColor = -1;

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return CustomCircleAvatar(
            isActive: selectedColor == i,
            color: colors[i],
            onTap: () {
              widget.cubit.color = colors[i];

              selectedColor = i;
              setState(() {});
            },
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}
