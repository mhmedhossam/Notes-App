import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_fonts.dart';
import 'package:notes_app/core/utils/app_colors.dart';

ThemeData themeData(dark) {
  return ThemeData(
    brightness: dark ? Brightness.dark : Brightness.light,
    fontFamily: AppFonts.poppins,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.secondColor.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.2),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: const Color.fromARGB(255, 248, 0, 0).withOpacity(0.2),
        ),
      ),
      filled: true,
      fillColor: Colors.black12,
    ),
  );
}
