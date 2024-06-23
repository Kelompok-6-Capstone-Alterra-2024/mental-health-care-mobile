import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class MainButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool isEnabled;

  const MainButton({
    required this.label,
    this.onTap,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isEnabled ? Primary.mainColor : Neutral.light1,
        ),
        child: Text(
          label,
          style: semiBold.copyWith(
              fontSize: 16, color: isEnabled ? Neutral.light1 : Neutral.dark3),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
