import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Neutral.light3,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile.png'),
                const Gap(16),
                Text(
                  'Kevin',
                  style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
              ],
            ),
            const Gap(16),
            Text(
              'Akhir-akhir ini aku merasa hidupku tidak punya tujuan. Pekerjaan yang tidak aku sukai membuat setiap hari terasa berat. Ada yang pernah merasakan hal ini? Bagaimana cara kalian mengatasinya?',
              style: regular.copyWith(fontSize: 12, color: Neutral.dark1),
            ),
            const Gap(10),
            const Divider(color: Neutral.dark3),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/like.svg',
                      width: 24,
                      height: 24,
                    ),
                    const Gap(6),
                    Text(
                      'Suka',
                      style:
                          semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/comment.svg',
                      width: 24,
                      height: 24,
                    ),
                    const Gap(6),
                    Text(
                      'Komentar',
                      style:
                          semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/share2.svg',
                      width: 24,
                      height: 24,
                    ),
                    const Gap(6),
                    Text(
                      'Bagi',
                      style:
                          semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
