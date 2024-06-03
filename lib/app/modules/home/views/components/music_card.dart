import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';


class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 11),
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
              image: const DecorationImage(
                image:
                    AssetImage('assets/images/music_cover.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                blur4,
                blur8,
              ]
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eternal Serenity',
                style: semiBold.copyWith(
                    fontSize: 16, color: Neutral.dark1),
              ),
              const Gap(8),
              Text(
                'Luna Grace',
                style: regular.copyWith(
                    fontSize: 12, color: Neutral.dark2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
