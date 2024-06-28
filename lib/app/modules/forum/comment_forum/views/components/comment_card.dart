import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../../constant/constant.dart';
import '../../data/models/comment_post_model.dart';

class CommentCard extends StatelessWidget {
  final AllComment commentData;

  const CommentCard({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(commentData.user.profilePicture),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        commentData.user.username,
                        style: semiBold.copyWith(
                            fontSize: 16, color: Neutral.dark1),
                      ),
                      const Gap(5),
                      Text(
                        timeago.format(commentData.createdAt, locale: 'id'),
                        style: regular.copyWith(
                            fontSize: 12, color: Neutral.dark3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(16),
            Text(
              commentData.content,
              style: regular.copyWith(fontSize: 12, color: Neutral.dark1),
            ),
          ],
        ),
      ),
    );
  }
}
