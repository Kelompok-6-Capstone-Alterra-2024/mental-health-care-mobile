import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class MusicCard extends StatelessWidget {
  final String title;
  final String singer;
  final String imageUrl;
  const MusicCard({
    super.key,
    required this.title,
    required this.singer,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: Neutral.light4,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  blur4,
                  blur8,
                ]),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
              ),
              const Gap(8),
              Text(
                singer,
                style: regular.copyWith(fontSize: 12, color: Neutral.dark2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
