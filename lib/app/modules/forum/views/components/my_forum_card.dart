import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class MyForumCard extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String imageUrl;
  const MyForumCard({
    super.key,
    required this.title,
    this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: Neutral.light4,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            blur4,
            blur8,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 202,
              height: 145,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  blur4,
                  blur8,
                ],
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  title,
                  style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                ),
                // Text(
                //   'TalkLife',
                //   style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
