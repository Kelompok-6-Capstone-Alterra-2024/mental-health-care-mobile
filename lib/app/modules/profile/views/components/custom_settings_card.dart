import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';


class CustomSettingCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function()? onTap;
  const CustomSettingCard({
    required this.icon,
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 22),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 24),
            const Gap(16),
            Text(
              title,
              style: regular.copyWith(fontSize: 16, color: Neutral.dark1),
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/ChevronRight.svg', width: 24),
          ],
        ),
      ),
    );
  }
}
