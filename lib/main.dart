import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/presentation/view/notes_view.dart';

import 'core/utils/theme_data.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(NotesApp());
}

class NotesApp extends StatefulWidget {
  bool dark;
  NotesApp({super.key, this.dark = true});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  late bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = widget.dark;
  }

  void toggleDark() {
    setState(() => _dark = !_dark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(_dark),
      home: NotesView(toggleDark: toggleDark),
    );
  }
}
