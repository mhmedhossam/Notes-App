import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 45),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyle(color: Colors.black)),
    );
  }
}
