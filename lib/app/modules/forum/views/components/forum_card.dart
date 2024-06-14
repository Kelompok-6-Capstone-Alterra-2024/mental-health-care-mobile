import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class ForumCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int numberOfMembers;

  const ForumCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.numberOfMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Neutral.light4,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          blur4,
          blur8,
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 63,
            height: 63,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                blur4,
                blur8,
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: semiBold.copyWith(
                            fontSize: 16, color: Neutral.dark1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Join forum');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 27,
                        width: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Primary.mainColor,
                        ),
                        child: Text(
                          'Join',
                          style: semiBold.copyWith(
                              fontSize: 12, color: Neutral.light4),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(6),
                Text(
                  '$numberOfMembers Anggota',
                  style: medium.copyWith(fontSize: 12, color: Neutral.dark3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
