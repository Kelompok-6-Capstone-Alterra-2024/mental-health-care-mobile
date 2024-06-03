import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class MoodCard extends StatelessWidget {
  final Function()? onTap;
  final String icon;
  final Color color;
  const MoodCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Neutral.light1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Sen',
              style: regular.copyWith(fontSize: 8, color: Neutral.dark2),
            ),
            const Gap(2),
            Text(
              '12',
              style: semiBold.copyWith(fontSize: 16, color: Neutral.dark2),
            ),
            SvgPicture.asset(icon)
          ],
        ),
      ),
    );
  }
}
