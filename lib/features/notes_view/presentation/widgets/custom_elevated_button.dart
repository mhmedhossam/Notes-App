import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String buttonText;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 45),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: onPressed,
      child: isLoading
          ? CircularProgressIndicator(
              color: AppColors.secondColor,
              padding: EdgeInsets.all(10),
            )
          : Text(buttonText, style: TextStyle(color: Colors.black)),
    );
  }
}
