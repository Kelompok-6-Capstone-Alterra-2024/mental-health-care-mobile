import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class MoodCard extends StatelessWidget {
  final Function()? onTap;
  final SvgPicture icon;
  final Color selectedColor;
  final Color textColor;
  final String day;
  final int date;
  final Color iconColor;
  const MoodCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.selectedColor,
    required this.textColor,
    required this.day,
    required this.date,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
            color: Neutral.light4,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedColor,
              width: 2,
            ),
            boxShadow: [blur4, blur8]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  day,
                  style: regular.copyWith(fontSize: 9, color: textColor),
                ),
                const Gap(2),
                Text(
                  date.toString(),
                  style: semiBold.copyWith(fontSize: 16, color: textColor),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: icon)
          ],
        ),
      ),
    );
  }
}
