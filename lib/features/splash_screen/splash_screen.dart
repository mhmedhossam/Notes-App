import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_images.dart';
import 'package:notes_app/core/utils/textstyles.dart';
import 'package:notes_app/features/notes_view/presentation/view/notes_view.dart';

class SplashScreen extends StatefulWidget {
  final void Function() toggleDark;
  const SplashScreen({super.key, required this.toggleDark});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return NotesView(toggleDark: widget.toggleDark);
          },
        ),
        (_) => true,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.noteImage, height: 150, width: 150),
            Text(
              "Notes App",
              style: TextStyles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Start noting your world",
              style: TextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
