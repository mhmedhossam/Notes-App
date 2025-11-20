import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/core/constants/constant.dart';
import 'package:notes_app/features/notes_view/data/models/note_model.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/add_note_cubit/addnotescubit.dart';
import 'package:notes_app/features/notes_view/presentation/cubits/notes_cubit/notescubit.dart';
import 'package:notes_app/features/notes_view/presentation/view/notes_view.dart';

import 'core/utils/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = BlocNoteObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
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
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(_dark),
        home: NotesView(toggleDark: toggleDark),
      ),
    );
  }
}
