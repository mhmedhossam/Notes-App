import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String date;
  final int color;
  NoteModel({
    required this.title,
    required this.color,
    required this.subTitle,
    required this.onTap,
    required this.date,
  });
}
