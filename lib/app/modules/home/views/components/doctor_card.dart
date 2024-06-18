
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String experience;
  final String rating;
  const DoctorCard({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Neutral.light4,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/doctor.png'),
          const Gap(16),
          Text(
            name,
            style: semiBold.copyWith(
                fontSize: 16, color: Neutral.dark1),
          ),
          const Gap(16),
          Text(
            experience,
            style: regular.copyWith(
                fontSize: 12, color: Neutral.dark2),
          ),
          const Gap(16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/Star.svg'),
              Text(
                rating,
                style: semiBold.copyWith(
                    fontSize: 12, color: Neutral.dark1),
              ),
              const Gap(10),
              SvgPicture.asset('assets/icons/Clock.svg'),
              const Gap(5),
              Text(
                '12:00 - 17:00',
                style: semiBold.copyWith(
                    fontSize: 12, color: Neutral.dark1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
