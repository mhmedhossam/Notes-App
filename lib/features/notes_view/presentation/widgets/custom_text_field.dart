import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/core/utils/app_colors.dart';
import 'package:notes_app/core/utils/textstyles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  TextInputAction? textInputAction;
  final Widget? prefixIcon;
  TextAlign textAlign;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  Color? cursorColor;
  final bool readOnly;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  void Function(PointerDownEvent)? onTapOutside;
  int? minLine;
  int? maxLine;
  CustomTextField({
    this.onTapOutside,
    this.onSaved,
    this.onFieldSubmitted,
    this.textAlign = TextAlign.left,
    super.key,
    required this.hintText,
    this.onTap,
    this.controller,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.prefixIcon,
    this.obscureText = false,
    this.inputFormatters,
    this.minLine,
    this.maxLine = 1,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onSaved: onSaved,
      textInputAction: textInputAction,
      cursorColor: cursorColor,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,
      onTapOutside: onTapOutside,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      minLines: minLine,
      maxLines: maxLine,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,

        suffixIcon: suffixIcon,
        hint: Text(
          hintText,
          textAlign: TextAlign.start,
          style: TextStyles.textStyle16.copyWith(color: AppColors.secondColor),
        ),
      ),
    );
  }
}
