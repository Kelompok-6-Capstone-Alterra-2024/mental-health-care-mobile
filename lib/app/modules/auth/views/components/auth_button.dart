import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant/constant.dart';

class AuthButton extends StatelessWidget {
  final String svgAssetPath;
  final String label;
  final Function()? onTap;

  const AuthButton({
    required this.svgAssetPath,
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Neutral.dark3,
          ),
          color: Neutral.light4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                svgAssetPath,
                width: 24,
                height: 24,
              ),
            ),
            Text(
              label,
              style: semiBold.copyWith(fontSize: 16, color: Neutral.dark3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
