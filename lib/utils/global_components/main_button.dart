
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class MainButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MainButton({
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Primary.mainColor,
        ),
        child: Text(
          label,
          style: semiBold.copyWith(fontSize: 16, color: Neutral.light4),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
