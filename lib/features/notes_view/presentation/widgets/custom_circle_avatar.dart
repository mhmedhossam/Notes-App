import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final int color;
  final bool isActive;
  final void Function() onTap;
  const CustomCircleAvatar({
    super.key,
    required this.color,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: CircleAvatar(
          radius: 38,
          backgroundColor: isActive ? Colors.blue : Colors.transparent,

          child: CircleAvatar(radius: 35, backgroundColor: Color(color)),
        ),
      ),
    );
  }
}
