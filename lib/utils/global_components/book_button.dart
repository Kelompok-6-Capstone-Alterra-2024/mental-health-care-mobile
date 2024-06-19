import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class BookButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;
  const BookButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        width: 68,
        height: 23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor,
        ),
        child: Text(
          label,
          style: semiBold.copyWith(fontSize: 12, color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}