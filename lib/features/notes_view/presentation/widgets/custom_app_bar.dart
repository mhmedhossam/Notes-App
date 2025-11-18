import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:notes_app/core/utils/textstyles.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback toggleDark;
  final String title;
  const CustomAppBar({
    super.key,
    required this.toggleDark,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(5),
        Text(title, style: Textstyles.textStyle30),
        Spacer(),
        TextButton(onPressed: toggleDark, child: Icon(Icons.dark_mode)),

        CustomSearchIcon(),
      ],
    );
  }
}
