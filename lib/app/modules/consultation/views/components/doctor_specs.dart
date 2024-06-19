import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class DoctorSpecs extends StatelessWidget {
  final String expericence;
  final String rating;
  final int cost;
  final String university;
  final String location;
  const DoctorSpecs({
    super.key,
    required this.expericence,
    required this.rating,
    required this.cost,
    required this.university,
    required this.location,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  expericence,
                  style:
                      semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
                ),
                Text(
                  'Pengalaman',
                  style: medium.copyWith(fontSize: 12, color: Neutral.dark3),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  rating,
                  style:
                      semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
                ),
                Text(
                  'Rating',
                  style: medium.copyWith(fontSize: 12, color: Neutral.dark3),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  cost.toString(),
                  style:
                      semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
                ),
                Text(
                  'Biaya',
                  style: medium.copyWith(fontSize: 12, color: Neutral.dark3),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Tentang Psikiater',
          style: semiBold.copyWith(fontSize: 16, color: Primary.mainColor),
        ),
        const Gap(8),
        Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: Primary.mainColor),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset('assets/icons/Mortarboard_light.svg'),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  university,
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark2),
                ),
                Text(
                  "Alumnus",
                  style: regular.copyWith(fontSize: 12, color: Neutral.dark2),
                )
              ],
            ),
          ],
        ),
        const Gap(8),
        Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: Primary.mainColor),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset('assets/icons/Location-Point.svg'),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: medium.copyWith(fontSize: 16, color: Neutral.dark2),
                ),
                Text(
                  "Lokasi Praktik",
                  style: regular.copyWith(fontSize: 12, color: Neutral.dark2),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
